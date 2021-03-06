<?php

namespace barrelstrength\sproutbaseemail\controllers;

use barrelstrength\sproutbaseemail\base\EmailTemplates;
use barrelstrength\sproutbaseemail\base\Mailer;
use barrelstrength\sproutbaseemail\base\NotificationEmailSenderInterface;
use barrelstrength\sproutbaseemail\emailtemplates\BasicTemplates;
use barrelstrength\sproutbaseemail\mailers\DefaultMailer;
use barrelstrength\sproutbaseemail\models\ModalResponse;
use barrelstrength\sproutbaseemail\elements\NotificationEmail;
use barrelstrength\sproutbase\SproutBase;
use barrelstrength\sproutbaseemail\SproutBaseEmail;
use barrelstrength\sproutbasefields\SproutBaseFields;
use barrelstrength\sproutbaseemail\models\Settings;
use craft\helpers\ElementHelper;
use craft\helpers\Json;
use craft\helpers\UrlHelper;
use craft\web\Controller;
use Craft;
use craft\base\Plugin;
use yii\base\Exception;
use yii\web\HttpException;
use yii\web\Response;

/**
 * Class NotificationsController
 *
 * @package barrelstrength\sproutbase\controllers
 */
class NotificationsController extends Controller
{
    private $currentPluginHandle;

    private $permissions = [];

    public function init()
    {
        $this->permissions = SproutBase::$app->settings->getPluginPermissions(new Settings(), 'sprout-email');

        parent::init();
    }

    /**
     * @return Response
     * @throws \yii\web\ForbiddenHttpException
     */
    public function actionIndex(): Response
    {
        $this->requirePermission($this->permissions['sproutEmail-viewNotifications']);

        return $this->renderTemplate('sprout-base-email/notifications/index', [
            'viewNotificationsPermission' => $this->permissions['sproutEmail-viewNotifications'],
        ]);
    }

    /**
     * @param null   $emailId
     * @param string $emailType
     *
     * @return Response
     * @throws \yii\web\ForbiddenHttpException
     */
    public function actionPreview(string $emailType, $emailId = null): Response
    {
        $this->requirePermission($this->permissions['sproutEmail-viewNotifications']);

        $email = Craft::$app->getElements()->getElementById($emailId, NotificationEmail::class);

        return $this->renderTemplate('sprout-base-email/notifications/_special/preview', [
            'email' => $email,
            'emailType' => $emailType
        ]);
    }

    /**
     * @param null                   $emailId
     * @param NotificationEmail|null $notificationEmail
     *
     * @return Response
     * @throws \yii\web\ForbiddenHttpException
     */
    public function actionEditNotificationEmailSettingsTemplate($emailId = null, NotificationEmail $notificationEmail = null): Response
    {
        $this->requireAdmin();

        $isNewNotificationEmail = $emailId !== null && $emailId === 'new';

        if (!$notificationEmail) {
            if ($isNewNotificationEmail) {
                $notificationEmail = new NotificationEmail();
            } else {
                $notificationEmail = Craft::$app->getElements()->getElementById($emailId, NotificationEmail::class);
            }
        }

        return $this->renderTemplate('sprout-base-email/notifications/_editFieldLayout', [
            'emailId' => $emailId,
            'notificationEmail' => $notificationEmail,
            'isNewNotificationEmail' => $isNewNotificationEmail
        ]);
    }

    /**
     * @param string                 $pluginHandle
     * @param null                   $emailId
     * @param NotificationEmail|null $notificationEmail
     *
     * @return Response
     * @throws Exception
     * @throws \Throwable
     * @throws \yii\base\InvalidConfigException
     * @throws \yii\web\ForbiddenHttpException
     */
    public function actionEditNotificationEmailTemplate(string $pluginHandle, $emailId = null, NotificationEmail $notificationEmail = null): Response
    {
        $this->requirePermission($this->permissions['sproutEmail-editNotifications']);

        $routeParams = Craft::$app->getUrlManager()->getRouteParams();

        // Immediately create a new Notification
        if ($emailId === 'new') {
            $notificationEmail = SproutBaseEmail::$app->notifications->createNewNotification();

            if ($notificationEmail) {
                $url = UrlHelper::cpUrl($pluginHandle.'/notifications/edit/'.$notificationEmail->id);
                return $this->redirect($url);
            }

            throw new Exception(Craft::t('sprout-base-email', 'Unable to create Notification Email'));
        }

        if (!$notificationEmail) {
            $notificationEmail = Craft::$app->getElements()->getElementById($emailId, NotificationEmail::class);
        }

        // Sort out Live Preview and Share button behaviors
        $showPreviewBtn = false;
        $shareUrl = null;

        $isMobileBrowser = Craft::$app->getRequest()->isMobileBrowser(true);

        $isSproutEmailInstalled = Craft::$app->plugins->getPlugin('sprout-email');

        if (!$isMobileBrowser && $isSproutEmailInstalled) {
            $showPreviewBtn = true;

            Craft::$app->getView()->registerJs(
                'Craft.LivePreview.init('.Json::encode(
                    [
                        'fields' => '#subjectLine-field, #body-field, #defaultBody, #title-field, #fields > div > .field',
                        'extraFields' => '#settings',
                        'previewUrl' => $notificationEmail->getUrl(),
                        'previewAction' => Craft::$app->getSecurity()->hashData('sprout-base-email/notifications/live-preview-notification-email'),
                        'previewParams' => [
                            'notificationId' => $notificationEmail->id,
                        ]
                    ]
                ).');'
            );

            if ($notificationEmail->id && $notificationEmail->getUrl()) {
                $shareUrl = UrlHelper::actionUrl('sprout-base-email/notifications/share-notification-email', [
                    'notificationId' => $notificationEmail->id,
                ]);
            }
        }

        $events = SproutBaseEmail::$app->notificationEvents->getNotificationEmailEvents($notificationEmail);

        $defaultEmailTemplate = BasicTemplates::class;

        if ($pluginHandle !== 'sprout-email') {
            $events = SproutBaseEmail::$app->notificationEvents->getNotificationEmailEventsByPluginHandle($notificationEmail, $pluginHandle);

            if (new $routeParams['defaultEmailTemplate'] instanceof EmailTemplates) {
                $defaultEmailTemplate = $routeParams['defaultEmailTemplate'];
            }
        }

        // Set a default template if we don't have one set
        if (!$notificationEmail->emailTemplateId) {
            $notificationEmail->emailTemplateId = $defaultEmailTemplate;
        }

        $lists = [];

        $tabs = [
            [
                'label' => 'Message',
                'url' => '#tab1',
                'class' => null,
            ]
        ];

        $tabs = $notificationEmail->getFieldLayoutTabs() ?: $tabs;

        return $this->renderTemplate('sprout-base-email/notifications/_edit', [
            'notificationEmail' => $notificationEmail,
            'events' => $events,
            'lists' => $lists,
            'tabs' => $tabs,
            'showPreviewBtn' => $showPreviewBtn,
            'shareUrl' => $shareUrl,
            'editNotificationsPermission' => $this->permissions['sproutEmail-editNotifications']
        ]);
    }

    /**
     * Save a Notification Email from the Notification Email template
     *
     * @return Response
     * @throws Exception
     * @throws \Throwable
     * @throws \craft\errors\MissingComponentException
     * @throws \yii\web\BadRequestHttpException
     */
    public function actionSaveNotificationEmail(): Response
    {
        $this->requirePostRequest();
        $this->requirePermission($this->permissions['sproutEmail-editNotifications']);

        $notificationEmail = new NotificationEmail();

        $notificationEmail->id = Craft::$app->getRequest()->getBodyParam('emailId');

        if ($notificationEmail->id) {
            $notificationEmail = Craft::$app->getElements()->getElementById($notificationEmail->id, NotificationEmail::class);
        }

        $notificationEmail->subjectLine = Craft::$app->getRequest()->getRequiredBodyParam('subjectLine');
        $notificationEmail->defaultBody = Craft::$app->getRequest()->getBodyParam('defaultBody');
        $notificationEmail->fromName = Craft::$app->getRequest()->getRequiredBodyParam('fromName');
        $notificationEmail->fromEmail = Craft::$app->getRequest()->getRequiredBodyParam('fromEmail');
        $notificationEmail->replyToEmail = Craft::$app->getRequest()->getBodyParam('replyToEmail');
        $notificationEmail->titleFormat = Craft::$app->getRequest()->getBodyParam('titleFormat');
        $notificationEmail->slug = Craft::$app->getRequest()->getBodyParam('slug');
        $notificationEmail->singleEmail = Craft::$app->getRequest()->getBodyParam('singleEmail');
        $notificationEmail->enableFileAttachments = Craft::$app->getRequest()->getBodyParam('enableFileAttachments');
        $notificationEmail->enabled = Craft::$app->getRequest()->getBodyParam('enabled');
        $notificationEmail->eventId = Craft::$app->getRequest()->getBodyParam('eventId');
        $notificationEmail->recipients = Craft::$app->getRequest()->getBodyParam('recipients');
        $notificationEmail->cc = Craft::$app->getRequest()->getBodyParam('cc');
        $notificationEmail->bcc = Craft::$app->getRequest()->getBodyParam('bcc');
        $notificationEmail->listSettings = Craft::$app->getRequest()->getBodyParam('lists');
        $notificationEmail->emailTemplateId = Craft::$app->getRequest()->getBodyParam('emailTemplateId');

        if (!$notificationEmail->replyToEmail) {
            $notificationEmail->replyToEmail = $notificationEmail->fromEmail;
        }

        if ($notificationEmail->slug === null) {
            $notificationEmail->slug = ElementHelper::createSlug($notificationEmail->subjectLine);
        }

        $fieldsLocation = Craft::$app->getRequest()->getBodyParam('fieldsLocation', 'fields');

        $notificationEmail->setFieldValuesFromRequest($fieldsLocation);

        $notificationEmail->title = $notificationEmail->subjectLine;

        if ($notificationEmail->titleFormat) {
            $notificationEmail->title = Craft::$app->getView()->renderObjectTemplate($notificationEmail->titleFormat, $notificationEmail);
        }

        $event = null;
        if ($notificationEmail->eventId) {
            $event = SproutBaseEmail::$app->notificationEvents->getEventById($notificationEmail->eventId);
        }

        if ($event) {

            $eventSettings = Craft::$app->getRequest()->getBodyParam('eventSettings');

            if (isset($eventSettings[$notificationEmail->eventId])) {
                $eventSettings = $eventSettings[$notificationEmail->eventId];

                $notificationEmail->settings = Json::encode($eventSettings);
            }

            /**
             * @var $plugin Plugin
             */
            $plugin = $event->getPlugin();

            if ($plugin) {
                $notificationEmail->pluginHandle = $plugin->id;
            }

            $notificationEmail->setEventObject($event->getMockEventObject());
        }

        // Get cp path cause template validation change current template path
        $cpPath = Craft::$app->getView()->getTemplatesPath();
        // @todo - disable template validations due to errors on clean installations
        // $validateTemplate = $this->validateTemplate($notificationEmail);
        $validateTemplate = true;

        if (!SproutBaseEmail::$app->notifications->saveNotification($notificationEmail)
            || $validateTemplate == false) {

            Craft::$app->getSession()->setError(Craft::t('sprout-base-email', 'Unable to save notification.'));

            $errorMessage = SproutBaseFields::$app->utilities->formatErrors();

            SproutBase::error($errorMessage);

            // Set the previous cp path to avoid not found template when showing errors
            if ($cpPath) {
                Craft::$app->getView()->setTemplatesPath($cpPath);
            }

            Craft::$app->getUrlManager()->setRouteParams([
                'notificationEmail' => $notificationEmail
            ]);

            return null;
        }

        Craft::$app->getSession()->setNotice(Craft::t('sprout-base-email', 'Notification saved.'));

        return $this->redirectToPostedUrl();
    }

    /**
     * @param NotificationEmail $notificationEmail
     *
     * @return bool
     */
    private function validateTemplate(NotificationEmail $notificationEmail): bool
    {
        try {
            $notificationEmail->getEmailTemplates()->getTextBody();
            $notificationEmail->getEmailTemplates()->getHtmlBody();
        } catch (\Exception $e) {
            $errorMessage = 'Dynamic variables on your template does not exist. '.$e->getMessage();
            $notificationEmail->addError('emailTemplateId', $errorMessage);

            SproutBaseFields::$app->utilities->addError('template', $errorMessage);

            return false;
        }

        return true;
    }

    /**
     * Save a Notification Email from the Notification Email Settings template
     *
     * @return null
     * @throws \Exception
     * @throws \Throwable
     * @throws \yii\base\Exception
     * @throws \yii\web\BadRequestHttpException
     */
    public function actionSaveNotificationEmailSettings()
    {
        $this->requirePostRequest();
        $this->requireAdmin();

        $notificationEmail = new NotificationEmail();

        $notificationEmail->id = Craft::$app->getRequest()->getBodyParam('emailId');

        if ($notificationEmail->id) {
            $notificationEmail = Craft::$app->getElements()->getElementById($notificationEmail->id, NotificationEmail::class);
        }

        // Set the field layout
        $fieldLayout = Craft::$app->getFields()->assembleLayoutFromPost();
        $fieldLayout->type = NotificationEmail::class;

        $notificationEmail->setFieldLayout($fieldLayout);

        if (!SproutBaseEmail::$app->notifications->saveNotification($notificationEmail)) {

            Craft::$app->getSession()->setError(Craft::t('sprout-base-email', 'Unable to save notification.'));

            $errorMessage = SproutBaseFields::$app->utilities->formatErrors();

            SproutBase::error($errorMessage);

            return Craft::$app->getUrlManager()->setRouteParams([
                'notificationEmail' => $notificationEmail
            ]);
        }

        Craft::$app->getSession()->setNotice(Craft::t('sprout-base-email', 'Notification saved.'));

        return $this->redirectToPostedUrl($notificationEmail);
    }

    /**
     * Delete a Notification Email
     *
     * @return bool|\yii\web\Response
     * @throws \Throwable
     * @throws \yii\web\BadRequestHttpException
     */
    public function actionDeleteNotificationEmail()
    {
        $this->requirePostRequest();
        $this->requirePermission($this->permissions['sproutEmail-editNotifications']);

        $notificationEmailId = Craft::$app->getRequest()->getBodyParam('emailId');

        /** @var NotificationEmail $notificationEmail */
        $notificationEmail = Craft::$app->getElements()->getElementById($notificationEmailId, NotificationEmail::class);

        if (!$notificationEmail) {
            throw new \InvalidArgumentException(Craft::t('sprout-base-email', 'No Notification Email exists with the ID “{id}”.', [
                'id' => $notificationEmailId
            ]));
        }

        if (!SproutBaseEmail::$app->notifications->deleteNotificationEmailById($notificationEmailId)) {

            if (Craft::$app->getRequest()->getIsAjax()) {
                return $this->asJson(['success' => false]);
            }

            Craft::info(Json::encode($notificationEmail->getErrors()));

            Craft::$app->getSession()->setNotice(Craft::t('sprout-base-email', 'Couldn’t delete notification.'));

            // Send the entry back to the template
            Craft::$app->getUrlManager()->setRouteParams([
                'notificationEmail' => $notificationEmail
            ]);

            return false;
        }

        if (Craft::$app->getRequest()->getIsAjax()) {
            return $this->asJson(['success' => true]);
        }

        Craft::$app->getSession()->setNotice(Craft::t('sprout-base-email', 'Notification deleted.'));

        return $this->redirect($this->currentPluginHandle.'/notifications');
    }

    /**
     * Send a notification email via a Mailer
     *
     * @return Response
     * @throws Exception
     * @throws \Throwable
     * @throws \Twig_Error_Loader
     * @throws \yii\web\BadRequestHttpException
     */
    public function actionSendTestNotificationEmail(): Response
    {
        $this->requirePostRequest();
        $this->requirePermission($this->permissions['sproutEmail-editNotifications']);

        $notificationId = Craft::$app->getRequest()->getBodyParam('notificationId');
        $recipients = Craft::$app->getRequest()->getBodyParam('recipients');

        /** @var NotificationEmail $notificationEmail */
        $notificationEmail = Craft::$app->getElements()->getElementById($notificationId, NotificationEmail::class);
        $notificationEmail->setIsTest();

        if (empty(trim($recipients))) {
            return $this->asJson(
                ModalResponse::createErrorModalResponse('sprout-base-email/_modals/response', [
                    'email' => $notificationEmail,
                    'message' => Craft::t('sprout-base-email', 'Add at least one recipient.')
                ])
            );
        }

        $notificationEmail->recipients = $recipients;
        $notificationEmail->title = $notificationEmail->subjectLine;

        $event = SproutBaseEmail::$app->notificationEvents->getEvent($notificationEmail);

        /** @var Mailer|NotificationEmailSenderInterface $mailer */
        $mailer = SproutBaseEmail::$app->mailers->getMailerByName(DefaultMailer::class);

        if (!$event) {
            return $this->asJson(
                ModalResponse::createErrorModalResponse('sprout-base-email/_modals/response', [
                    'email' => $notificationEmail,
                    'message' => Craft::t('sprout-base-email', 'Unable to find Notification Email event.')
                ])
            );
        }

        $notificationEmail->setEventObject($event->getMockEventObject());

        $recipientList = $mailer->getRecipientList($notificationEmail);

        if ($recipientList->getInvalidRecipients()) {
            $invalidEmails = [];
            foreach ($recipientList->getInvalidRecipients() as $invalidRecipient) {
                $invalidEmails[] = $invalidRecipient->email;
            }

            return $this->asJson(
                ModalResponse::createErrorModalResponse('sprout-base-email/_modals/response', [
                    'email' => $notificationEmail,
                    'message' => Craft::t('sprout-base-email', 'Recipient email addresses do not validate: {invalidEmails}', [
                        'invalidEmails' => implode(', ', $invalidEmails)
                    ])
                ])
            );
        }

        if (!$mailer->sendNotificationEmail($notificationEmail)) {
            return $this->asJson(
                ModalResponse::createErrorModalResponse('sprout-base-email/_modals/response', [
                    'email' => $notificationEmail,
                    'message' => Craft::t('sprout-base-email', 'Unable to send Test Notification Email')
                ])
            );
        }

        return $this->asJson(
            ModalResponse::createModalResponse('sprout-base-email/_modals/response', [
                'email' => $notificationEmail,
                'message' => Craft::t('sprout-base-email', 'Test Notification Email sent.')
            ])
        );
    }

    /**
     * Prepares a Notification Email to be shared via token-based URL
     *
     * @param null $notificationId
     *
     * @return Response
     * @throws Exception
     * @throws HttpException
     */
    public function actionShareNotificationEmail($notificationId = null): Response
    {
        if ($notificationId) {
            $notificationEmail = Craft::$app->getElements()->getElementById($notificationId, NotificationEmail::class);

            if (!$notificationEmail) {
                throw new HttpException(404);
            }

            $type = Craft::$app->getRequest()->getQueryParam('type');

            $params = [
                'notificationId' => $notificationId,
                'type' => $type
            ];
        } else {
            throw new HttpException(404);
        }

        // Create the token and redirect to the entry URL with the token in place
        $token = Craft::$app->getTokens()->createToken([
                'sprout-base-email/notifications/view-shared-notification-email',
                $params
            ]
        );

        $url = UrlHelper::urlWithToken($notificationEmail->getUrl(), $token);

        return $this->redirect($url);
    }

    /**
     * Renders a shared Notification Email
     *
     * @param null $notificationId
     * @param null $type
     *
     * @throws Exception
     * @throws \Twig_Error_Loader
     * @throws \yii\base\ExitException
     * @throws \yii\web\BadRequestHttpException
     */
    public function actionViewSharedNotificationEmail($notificationId = null, $type = null)
    {
        $this->requireToken();

        SproutBaseEmail::$app->notifications->getPreviewNotificationEmailById($notificationId, $type);
    }


    /**
     * Renders a Notification Email for Live Preview
     *
     * @throws Exception
     * @throws \Twig_Error_Loader
     * @throws \yii\base\ExitException
     */
    public function actionLivePreviewNotificationEmail()
    {
        $notificationId = Craft::$app->getRequest()->getBodyParam('notificationId');

        SproutBaseEmail::$app->notifications->getPreviewNotificationEmailById($notificationId);
    }
}
