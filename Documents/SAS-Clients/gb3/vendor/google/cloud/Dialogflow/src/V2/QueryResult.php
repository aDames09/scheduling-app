<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dialogflow/v2/session.proto

namespace Google\Cloud\Dialogflow\V2;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * Represents the result of conversational query or event processing.
 *
 * Generated from protobuf message <code>google.cloud.dialogflow.v2.QueryResult</code>
 */
class QueryResult extends \Google\Protobuf\Internal\Message
{
    /**
     * The original conversational query text:
     * - If natural language text was provided as input, `query_text` contains
     *   a copy of the input.
     * - If natural language speech audio was provided as input, `query_text`
     *   contains the speech recognition result. If speech recognizer produced
     *   multiple alternatives, a particular one is picked.
     * - If an event was provided as input, `query_text` is not set.
     *
     * Generated from protobuf field <code>string query_text = 1;</code>
     */
    private $query_text = '';
    /**
     * The language that was triggered during intent detection.
     * See [Language
     * Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language)
     * for a list of the currently supported language codes.
     *
     * Generated from protobuf field <code>string language_code = 15;</code>
     */
    private $language_code = '';
    /**
     * The Speech recognition confidence between 0.0 and 1.0. A higher number
     * indicates an estimated greater likelihood that the recognized words are
     * correct. The default of 0.0 is a sentinel value indicating that confidence
     * was not set.
     * This field is not guaranteed to be accurate or set. In particular this
     * field isn't set for StreamingDetectIntent since the streaming endpoint has
     * separate confidence estimates per portion of the audio in
     * StreamingRecognitionResult.
     *
     * Generated from protobuf field <code>float speech_recognition_confidence = 2;</code>
     */
    private $speech_recognition_confidence = 0.0;
    /**
     * The action name from the matched intent.
     *
     * Generated from protobuf field <code>string action = 3;</code>
     */
    private $action = '';
    /**
     * The collection of extracted parameters.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct parameters = 4;</code>
     */
    private $parameters = null;
    /**
     * This field is set to:
     * - `false` if the matched intent has required parameters and not all of
     *    the required parameter values have been collected.
     * - `true` if all required parameter values have been collected, or if the
     *    matched intent doesn't contain any required parameters.
     *
     * Generated from protobuf field <code>bool all_required_params_present = 5;</code>
     */
    private $all_required_params_present = false;
    /**
     * The text to be pronounced to the user or shown on the screen.
     * Note: This is a legacy field, `fulfillment_messages` should be preferred.
     *
     * Generated from protobuf field <code>string fulfillment_text = 6;</code>
     */
    private $fulfillment_text = '';
    /**
     * The collection of rich messages to present to the user.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dialogflow.v2.Intent.Message fulfillment_messages = 7;</code>
     */
    private $fulfillment_messages;
    /**
     * If the query was fulfilled by a webhook call, this field is set to the
     * value of the `source` field returned in the webhook response.
     *
     * Generated from protobuf field <code>string webhook_source = 8;</code>
     */
    private $webhook_source = '';
    /**
     * If the query was fulfilled by a webhook call, this field is set to the
     * value of the `payload` field returned in the webhook response.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct webhook_payload = 9;</code>
     */
    private $webhook_payload = null;
    /**
     * The collection of output contexts. If applicable,
     * `output_contexts.parameters` contains entries with name
     * `<parameter name>.original` containing the original parameter values
     * before the query.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dialogflow.v2.Context output_contexts = 10;</code>
     */
    private $output_contexts;
    /**
     * The intent that matched the conversational query. Some, not
     * all fields are filled in this message, including but not limited to:
     * `name`, `display_name` and `webhook_state`.
     *
     * Generated from protobuf field <code>.google.cloud.dialogflow.v2.Intent intent = 11;</code>
     */
    private $intent = null;
    /**
     * The intent detection confidence. Values range from 0.0
     * (completely uncertain) to 1.0 (completely certain).
     * If there are `multiple knowledge_answers` messages, this value is set to
     * the greatest `knowledgeAnswers.match_confidence` value in the list.
     *
     * Generated from protobuf field <code>float intent_detection_confidence = 12;</code>
     */
    private $intent_detection_confidence = 0.0;
    /**
     * The free-form diagnostic info. For example, this field could contain
     * webhook call latency. The string keys of the Struct's fields map can change
     * without notice.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct diagnostic_info = 14;</code>
     */
    private $diagnostic_info = null;
    /**
     * The sentiment analysis result, which depends on the
     * `sentiment_analysis_request_config` specified in the request.
     *
     * Generated from protobuf field <code>.google.cloud.dialogflow.v2.SentimentAnalysisResult sentiment_analysis_result = 17;</code>
     */
    private $sentiment_analysis_result = null;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type string $query_text
     *           The original conversational query text:
     *           - If natural language text was provided as input, `query_text` contains
     *             a copy of the input.
     *           - If natural language speech audio was provided as input, `query_text`
     *             contains the speech recognition result. If speech recognizer produced
     *             multiple alternatives, a particular one is picked.
     *           - If an event was provided as input, `query_text` is not set.
     *     @type string $language_code
     *           The language that was triggered during intent detection.
     *           See [Language
     *           Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language)
     *           for a list of the currently supported language codes.
     *     @type float $speech_recognition_confidence
     *           The Speech recognition confidence between 0.0 and 1.0. A higher number
     *           indicates an estimated greater likelihood that the recognized words are
     *           correct. The default of 0.0 is a sentinel value indicating that confidence
     *           was not set.
     *           This field is not guaranteed to be accurate or set. In particular this
     *           field isn't set for StreamingDetectIntent since the streaming endpoint has
     *           separate confidence estimates per portion of the audio in
     *           StreamingRecognitionResult.
     *     @type string $action
     *           The action name from the matched intent.
     *     @type \Google\Protobuf\Struct $parameters
     *           The collection of extracted parameters.
     *     @type bool $all_required_params_present
     *           This field is set to:
     *           - `false` if the matched intent has required parameters and not all of
     *              the required parameter values have been collected.
     *           - `true` if all required parameter values have been collected, or if the
     *              matched intent doesn't contain any required parameters.
     *     @type string $fulfillment_text
     *           The text to be pronounced to the user or shown on the screen.
     *           Note: This is a legacy field, `fulfillment_messages` should be preferred.
     *     @type \Google\Cloud\Dialogflow\V2\Intent\Message[]|\Google\Protobuf\Internal\RepeatedField $fulfillment_messages
     *           The collection of rich messages to present to the user.
     *     @type string $webhook_source
     *           If the query was fulfilled by a webhook call, this field is set to the
     *           value of the `source` field returned in the webhook response.
     *     @type \Google\Protobuf\Struct $webhook_payload
     *           If the query was fulfilled by a webhook call, this field is set to the
     *           value of the `payload` field returned in the webhook response.
     *     @type \Google\Cloud\Dialogflow\V2\Context[]|\Google\Protobuf\Internal\RepeatedField $output_contexts
     *           The collection of output contexts. If applicable,
     *           `output_contexts.parameters` contains entries with name
     *           `<parameter name>.original` containing the original parameter values
     *           before the query.
     *     @type \Google\Cloud\Dialogflow\V2\Intent $intent
     *           The intent that matched the conversational query. Some, not
     *           all fields are filled in this message, including but not limited to:
     *           `name`, `display_name` and `webhook_state`.
     *     @type float $intent_detection_confidence
     *           The intent detection confidence. Values range from 0.0
     *           (completely uncertain) to 1.0 (completely certain).
     *           If there are `multiple knowledge_answers` messages, this value is set to
     *           the greatest `knowledgeAnswers.match_confidence` value in the list.
     *     @type \Google\Protobuf\Struct $diagnostic_info
     *           The free-form diagnostic info. For example, this field could contain
     *           webhook call latency. The string keys of the Struct's fields map can change
     *           without notice.
     *     @type \Google\Cloud\Dialogflow\V2\SentimentAnalysisResult $sentiment_analysis_result
     *           The sentiment analysis result, which depends on the
     *           `sentiment_analysis_request_config` specified in the request.
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Google\Cloud\Dialogflow\V2\Session::initOnce();
        parent::__construct($data);
    }

    /**
     * The original conversational query text:
     * - If natural language text was provided as input, `query_text` contains
     *   a copy of the input.
     * - If natural language speech audio was provided as input, `query_text`
     *   contains the speech recognition result. If speech recognizer produced
     *   multiple alternatives, a particular one is picked.
     * - If an event was provided as input, `query_text` is not set.
     *
     * Generated from protobuf field <code>string query_text = 1;</code>
     * @return string
     */
    public function getQueryText()
    {
        return $this->query_text;
    }

    /**
     * The original conversational query text:
     * - If natural language text was provided as input, `query_text` contains
     *   a copy of the input.
     * - If natural language speech audio was provided as input, `query_text`
     *   contains the speech recognition result. If speech recognizer produced
     *   multiple alternatives, a particular one is picked.
     * - If an event was provided as input, `query_text` is not set.
     *
     * Generated from protobuf field <code>string query_text = 1;</code>
     * @param string $var
     * @return $this
     */
    public function setQueryText($var)
    {
        GPBUtil::checkString($var, True);
        $this->query_text = $var;

        return $this;
    }

    /**
     * The language that was triggered during intent detection.
     * See [Language
     * Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language)
     * for a list of the currently supported language codes.
     *
     * Generated from protobuf field <code>string language_code = 15;</code>
     * @return string
     */
    public function getLanguageCode()
    {
        return $this->language_code;
    }

    /**
     * The language that was triggered during intent detection.
     * See [Language
     * Support](https://cloud.google.com/dialogflow-enterprise/docs/reference/language)
     * for a list of the currently supported language codes.
     *
     * Generated from protobuf field <code>string language_code = 15;</code>
     * @param string $var
     * @return $this
     */
    public function setLanguageCode($var)
    {
        GPBUtil::checkString($var, True);
        $this->language_code = $var;

        return $this;
    }

    /**
     * The Speech recognition confidence between 0.0 and 1.0. A higher number
     * indicates an estimated greater likelihood that the recognized words are
     * correct. The default of 0.0 is a sentinel value indicating that confidence
     * was not set.
     * This field is not guaranteed to be accurate or set. In particular this
     * field isn't set for StreamingDetectIntent since the streaming endpoint has
     * separate confidence estimates per portion of the audio in
     * StreamingRecognitionResult.
     *
     * Generated from protobuf field <code>float speech_recognition_confidence = 2;</code>
     * @return float
     */
    public function getSpeechRecognitionConfidence()
    {
        return $this->speech_recognition_confidence;
    }

    /**
     * The Speech recognition confidence between 0.0 and 1.0. A higher number
     * indicates an estimated greater likelihood that the recognized words are
     * correct. The default of 0.0 is a sentinel value indicating that confidence
     * was not set.
     * This field is not guaranteed to be accurate or set. In particular this
     * field isn't set for StreamingDetectIntent since the streaming endpoint has
     * separate confidence estimates per portion of the audio in
     * StreamingRecognitionResult.
     *
     * Generated from protobuf field <code>float speech_recognition_confidence = 2;</code>
     * @param float $var
     * @return $this
     */
    public function setSpeechRecognitionConfidence($var)
    {
        GPBUtil::checkFloat($var);
        $this->speech_recognition_confidence = $var;

        return $this;
    }

    /**
     * The action name from the matched intent.
     *
     * Generated from protobuf field <code>string action = 3;</code>
     * @return string
     */
    public function getAction()
    {
        return $this->action;
    }

    /**
     * The action name from the matched intent.
     *
     * Generated from protobuf field <code>string action = 3;</code>
     * @param string $var
     * @return $this
     */
    public function setAction($var)
    {
        GPBUtil::checkString($var, True);
        $this->action = $var;

        return $this;
    }

    /**
     * The collection of extracted parameters.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct parameters = 4;</code>
     * @return \Google\Protobuf\Struct
     */
    public function getParameters()
    {
        return $this->parameters;
    }

    /**
     * The collection of extracted parameters.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct parameters = 4;</code>
     * @param \Google\Protobuf\Struct $var
     * @return $this
     */
    public function setParameters($var)
    {
        GPBUtil::checkMessage($var, \Google\Protobuf\Struct::class);
        $this->parameters = $var;

        return $this;
    }

    /**
     * This field is set to:
     * - `false` if the matched intent has required parameters and not all of
     *    the required parameter values have been collected.
     * - `true` if all required parameter values have been collected, or if the
     *    matched intent doesn't contain any required parameters.
     *
     * Generated from protobuf field <code>bool all_required_params_present = 5;</code>
     * @return bool
     */
    public function getAllRequiredParamsPresent()
    {
        return $this->all_required_params_present;
    }

    /**
     * This field is set to:
     * - `false` if the matched intent has required parameters and not all of
     *    the required parameter values have been collected.
     * - `true` if all required parameter values have been collected, or if the
     *    matched intent doesn't contain any required parameters.
     *
     * Generated from protobuf field <code>bool all_required_params_present = 5;</code>
     * @param bool $var
     * @return $this
     */
    public function setAllRequiredParamsPresent($var)
    {
        GPBUtil::checkBool($var);
        $this->all_required_params_present = $var;

        return $this;
    }

    /**
     * The text to be pronounced to the user or shown on the screen.
     * Note: This is a legacy field, `fulfillment_messages` should be preferred.
     *
     * Generated from protobuf field <code>string fulfillment_text = 6;</code>
     * @return string
     */
    public function getFulfillmentText()
    {
        return $this->fulfillment_text;
    }

    /**
     * The text to be pronounced to the user or shown on the screen.
     * Note: This is a legacy field, `fulfillment_messages` should be preferred.
     *
     * Generated from protobuf field <code>string fulfillment_text = 6;</code>
     * @param string $var
     * @return $this
     */
    public function setFulfillmentText($var)
    {
        GPBUtil::checkString($var, True);
        $this->fulfillment_text = $var;

        return $this;
    }

    /**
     * The collection of rich messages to present to the user.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dialogflow.v2.Intent.Message fulfillment_messages = 7;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getFulfillmentMessages()
    {
        return $this->fulfillment_messages;
    }

    /**
     * The collection of rich messages to present to the user.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dialogflow.v2.Intent.Message fulfillment_messages = 7;</code>
     * @param \Google\Cloud\Dialogflow\V2\Intent\Message[]|\Google\Protobuf\Internal\RepeatedField $var
     * @return $this
     */
    public function setFulfillmentMessages($var)
    {
        $arr = GPBUtil::checkRepeatedField($var, \Google\Protobuf\Internal\GPBType::MESSAGE, \Google\Cloud\Dialogflow\V2\Intent\Message::class);
        $this->fulfillment_messages = $arr;

        return $this;
    }

    /**
     * If the query was fulfilled by a webhook call, this field is set to the
     * value of the `source` field returned in the webhook response.
     *
     * Generated from protobuf field <code>string webhook_source = 8;</code>
     * @return string
     */
    public function getWebhookSource()
    {
        return $this->webhook_source;
    }

    /**
     * If the query was fulfilled by a webhook call, this field is set to the
     * value of the `source` field returned in the webhook response.
     *
     * Generated from protobuf field <code>string webhook_source = 8;</code>
     * @param string $var
     * @return $this
     */
    public function setWebhookSource($var)
    {
        GPBUtil::checkString($var, True);
        $this->webhook_source = $var;

        return $this;
    }

    /**
     * If the query was fulfilled by a webhook call, this field is set to the
     * value of the `payload` field returned in the webhook response.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct webhook_payload = 9;</code>
     * @return \Google\Protobuf\Struct
     */
    public function getWebhookPayload()
    {
        return $this->webhook_payload;
    }

    /**
     * If the query was fulfilled by a webhook call, this field is set to the
     * value of the `payload` field returned in the webhook response.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct webhook_payload = 9;</code>
     * @param \Google\Protobuf\Struct $var
     * @return $this
     */
    public function setWebhookPayload($var)
    {
        GPBUtil::checkMessage($var, \Google\Protobuf\Struct::class);
        $this->webhook_payload = $var;

        return $this;
    }

    /**
     * The collection of output contexts. If applicable,
     * `output_contexts.parameters` contains entries with name
     * `<parameter name>.original` containing the original parameter values
     * before the query.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dialogflow.v2.Context output_contexts = 10;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getOutputContexts()
    {
        return $this->output_contexts;
    }

    /**
     * The collection of output contexts. If applicable,
     * `output_contexts.parameters` contains entries with name
     * `<parameter name>.original` containing the original parameter values
     * before the query.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dialogflow.v2.Context output_contexts = 10;</code>
     * @param \Google\Cloud\Dialogflow\V2\Context[]|\Google\Protobuf\Internal\RepeatedField $var
     * @return $this
     */
    public function setOutputContexts($var)
    {
        $arr = GPBUtil::checkRepeatedField($var, \Google\Protobuf\Internal\GPBType::MESSAGE, \Google\Cloud\Dialogflow\V2\Context::class);
        $this->output_contexts = $arr;

        return $this;
    }

    /**
     * The intent that matched the conversational query. Some, not
     * all fields are filled in this message, including but not limited to:
     * `name`, `display_name` and `webhook_state`.
     *
     * Generated from protobuf field <code>.google.cloud.dialogflow.v2.Intent intent = 11;</code>
     * @return \Google\Cloud\Dialogflow\V2\Intent
     */
    public function getIntent()
    {
        return $this->intent;
    }

    /**
     * The intent that matched the conversational query. Some, not
     * all fields are filled in this message, including but not limited to:
     * `name`, `display_name` and `webhook_state`.
     *
     * Generated from protobuf field <code>.google.cloud.dialogflow.v2.Intent intent = 11;</code>
     * @param \Google\Cloud\Dialogflow\V2\Intent $var
     * @return $this
     */
    public function setIntent($var)
    {
        GPBUtil::checkMessage($var, \Google\Cloud\Dialogflow\V2\Intent::class);
        $this->intent = $var;

        return $this;
    }

    /**
     * The intent detection confidence. Values range from 0.0
     * (completely uncertain) to 1.0 (completely certain).
     * If there are `multiple knowledge_answers` messages, this value is set to
     * the greatest `knowledgeAnswers.match_confidence` value in the list.
     *
     * Generated from protobuf field <code>float intent_detection_confidence = 12;</code>
     * @return float
     */
    public function getIntentDetectionConfidence()
    {
        return $this->intent_detection_confidence;
    }

    /**
     * The intent detection confidence. Values range from 0.0
     * (completely uncertain) to 1.0 (completely certain).
     * If there are `multiple knowledge_answers` messages, this value is set to
     * the greatest `knowledgeAnswers.match_confidence` value in the list.
     *
     * Generated from protobuf field <code>float intent_detection_confidence = 12;</code>
     * @param float $var
     * @return $this
     */
    public function setIntentDetectionConfidence($var)
    {
        GPBUtil::checkFloat($var);
        $this->intent_detection_confidence = $var;

        return $this;
    }

    /**
     * The free-form diagnostic info. For example, this field could contain
     * webhook call latency. The string keys of the Struct's fields map can change
     * without notice.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct diagnostic_info = 14;</code>
     * @return \Google\Protobuf\Struct
     */
    public function getDiagnosticInfo()
    {
        return $this->diagnostic_info;
    }

    /**
     * The free-form diagnostic info. For example, this field could contain
     * webhook call latency. The string keys of the Struct's fields map can change
     * without notice.
     *
     * Generated from protobuf field <code>.google.protobuf.Struct diagnostic_info = 14;</code>
     * @param \Google\Protobuf\Struct $var
     * @return $this
     */
    public function setDiagnosticInfo($var)
    {
        GPBUtil::checkMessage($var, \Google\Protobuf\Struct::class);
        $this->diagnostic_info = $var;

        return $this;
    }

    /**
     * The sentiment analysis result, which depends on the
     * `sentiment_analysis_request_config` specified in the request.
     *
     * Generated from protobuf field <code>.google.cloud.dialogflow.v2.SentimentAnalysisResult sentiment_analysis_result = 17;</code>
     * @return \Google\Cloud\Dialogflow\V2\SentimentAnalysisResult
     */
    public function getSentimentAnalysisResult()
    {
        return $this->sentiment_analysis_result;
    }

    /**
     * The sentiment analysis result, which depends on the
     * `sentiment_analysis_request_config` specified in the request.
     *
     * Generated from protobuf field <code>.google.cloud.dialogflow.v2.SentimentAnalysisResult sentiment_analysis_result = 17;</code>
     * @param \Google\Cloud\Dialogflow\V2\SentimentAnalysisResult $var
     * @return $this
     */
    public function setSentimentAnalysisResult($var)
    {
        GPBUtil::checkMessage($var, \Google\Cloud\Dialogflow\V2\SentimentAnalysisResult::class);
        $this->sentiment_analysis_result = $var;

        return $this;
    }

}

