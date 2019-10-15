<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/dataproc/v1/workflow_templates.proto

namespace Google\Cloud\Dataproc\V1;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * A response to a request to list workflow templates in a project.
 *
 * Generated from protobuf message <code>google.cloud.dataproc.v1.ListWorkflowTemplatesResponse</code>
 */
class ListWorkflowTemplatesResponse extends \Google\Protobuf\Internal\Message
{
    /**
     * Output only. WorkflowTemplates list.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dataproc.v1.WorkflowTemplate templates = 1;</code>
     */
    private $templates;
    /**
     * Output only. This token is included in the response if there are more
     * results to fetch. To fetch additional results, provide this value as the
     * page_token in a subsequent <code>ListWorkflowTemplatesRequest</code>.
     *
     * Generated from protobuf field <code>string next_page_token = 2;</code>
     */
    private $next_page_token = '';

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type \Google\Cloud\Dataproc\V1\WorkflowTemplate[]|\Google\Protobuf\Internal\RepeatedField $templates
     *           Output only. WorkflowTemplates list.
     *     @type string $next_page_token
     *           Output only. This token is included in the response if there are more
     *           results to fetch. To fetch additional results, provide this value as the
     *           page_token in a subsequent <code>ListWorkflowTemplatesRequest</code>.
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Google\Cloud\Dataproc\V1\WorkflowTemplates::initOnce();
        parent::__construct($data);
    }

    /**
     * Output only. WorkflowTemplates list.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dataproc.v1.WorkflowTemplate templates = 1;</code>
     * @return \Google\Protobuf\Internal\RepeatedField
     */
    public function getTemplates()
    {
        return $this->templates;
    }

    /**
     * Output only. WorkflowTemplates list.
     *
     * Generated from protobuf field <code>repeated .google.cloud.dataproc.v1.WorkflowTemplate templates = 1;</code>
     * @param \Google\Cloud\Dataproc\V1\WorkflowTemplate[]|\Google\Protobuf\Internal\RepeatedField $var
     * @return $this
     */
    public function setTemplates($var)
    {
        $arr = GPBUtil::checkRepeatedField($var, \Google\Protobuf\Internal\GPBType::MESSAGE, \Google\Cloud\Dataproc\V1\WorkflowTemplate::class);
        $this->templates = $arr;

        return $this;
    }

    /**
     * Output only. This token is included in the response if there are more
     * results to fetch. To fetch additional results, provide this value as the
     * page_token in a subsequent <code>ListWorkflowTemplatesRequest</code>.
     *
     * Generated from protobuf field <code>string next_page_token = 2;</code>
     * @return string
     */
    public function getNextPageToken()
    {
        return $this->next_page_token;
    }

    /**
     * Output only. This token is included in the response if there are more
     * results to fetch. To fetch additional results, provide this value as the
     * page_token in a subsequent <code>ListWorkflowTemplatesRequest</code>.
     *
     * Generated from protobuf field <code>string next_page_token = 2;</code>
     * @param string $var
     * @return $this
     */
    public function setNextPageToken($var)
    {
        GPBUtil::checkString($var, True);
        $this->next_page_token = $var;

        return $this;
    }

}

