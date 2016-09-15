# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws
  module WAF
    module Types

      # The `ActivatedRule` object in an UpdateWebACL request specifies a
      # `Rule` that you want to insert or delete, the priority of the `Rule`
      # in the `WebACL`, and the action that you want AWS WAF to take when a
      # web request matches the `Rule` (`ALLOW`, `BLOCK`, or `COUNT`).
      #
      # To specify whether to insert or delete a `Rule`, use the `Action`
      # parameter in the WebACLUpdate data type.
      # @note When making an API call, pass ActivatedRule
      #   data as a hash:
      #
      #       {
      #         priority: 1, # required
      #         rule_id: "ResourceId", # required
      #         action: { # required
      #           type: "BLOCK", # required, accepts BLOCK, ALLOW, COUNT
      #         },
      #       }
      class ActivatedRule < Struct.new(
        :priority,
        :rule_id,
        :action)

        include Aws::Structure

        # @!attribute [rw] priority
        #   Specifies the order in which the `Rules` in a `WebACL` are
        #   evaluated. Rules with a lower value for `Priority` are evaluated
        #   before `Rules` with a higher value. The value must be a unique
        #   integer. If you add multiple `Rules` to a `WebACL`, the values
        #   don\'t need to be consecutive.
        #   @return [Integer]

        # @!attribute [rw] rule_id
        #   The `RuleId` for a `Rule`. You use `RuleId` to get more information
        #   about a `Rule` (see GetRule), update a `Rule` (see UpdateRule),
        #   insert a `Rule` into a `WebACL` or delete a one from a `WebACL` (see
        #   UpdateWebACL), or delete a `Rule` from AWS WAF (see DeleteRule).
        #
        #   `RuleId` is returned by CreateRule and by ListRules.
        #   @return [String]

        # @!attribute [rw] action
        #   Specifies the action that CloudFront or AWS WAF takes when a web
        #   request matches the conditions in the `Rule`. Valid values for
        #   `Action` include the following:
        #
        #   * `ALLOW`\: CloudFront responds with the requested object.
        #   * `BLOCK`\: CloudFront responds with an HTTP 403 (Forbidden) status
        #     code.
        #   * `COUNT`\: AWS WAF increments a counter of requests that match the
        #     conditions in the rule and then continues to inspect the web
        #     request based on the remaining rules in the web ACL.
        #   @return [Types::WafAction]

      end

      # In a GetByteMatchSet request, `ByteMatchSet` is a complex type that
      # contains the `ByteMatchSetId` and `Name` of a `ByteMatchSet`, and the
      # values that you specified when you updated the `ByteMatchSet`.
      #
      # A complex type that contains `ByteMatchTuple` objects, which specify
      # the parts of web requests that you want AWS WAF to inspect and the
      # values that you want AWS WAF to search for. If a `ByteMatchSet`
      # contains more than one `ByteMatchTuple` object, a request needs to
      # match the settings in only one `ByteMatchTuple` to be considered a
      # match.
      class ByteMatchSet < Struct.new(
        :byte_match_set_id,
        :name,
        :byte_match_tuples)

        include Aws::Structure

        # @!attribute [rw] byte_match_set_id
        #   The `ByteMatchSetId` for a `ByteMatchSet`. You use `ByteMatchSetId`
        #   to get information about a `ByteMatchSet` (see GetByteMatchSet),
        #   update a `ByteMatchSet` (see UpdateByteMatchSet), insert a
        #   `ByteMatchSet` into a `Rule` or delete one from a `Rule` (see
        #   UpdateRule), and delete a `ByteMatchSet` from AWS WAF (see
        #   DeleteByteMatchSet).
        #
        #   `ByteMatchSetId` is returned by CreateByteMatchSet and by
        #   ListByteMatchSets.
        #   @return [String]

        # @!attribute [rw] name
        #   A friendly name or description of the ByteMatchSet. You can\'t
        #   change `Name` after you create a `ByteMatchSet`.
        #   @return [String]

        # @!attribute [rw] byte_match_tuples
        #   Specifies the bytes (typically a string that corresponds with ASCII
        #   characters) that you want AWS WAF to search for in web requests, the
        #   location in requests that you want AWS WAF to search, and other
        #   settings.
        #   @return [Array<Types::ByteMatchTuple>]

      end

      # Returned by ListByteMatchSets. Each `ByteMatchSetSummary` object
      # includes the `Name` and `ByteMatchSetId` for one ByteMatchSet.
      class ByteMatchSetSummary < Struct.new(
        :byte_match_set_id,
        :name)

        include Aws::Structure

        # @!attribute [rw] byte_match_set_id
        #   The `ByteMatchSetId` for a `ByteMatchSet`. You use `ByteMatchSetId`
        #   to get information about a `ByteMatchSet`, update a `ByteMatchSet`,
        #   remove a `ByteMatchSet` from a `Rule`, and delete a `ByteMatchSet`
        #   from AWS WAF.
        #
        #   `ByteMatchSetId` is returned by CreateByteMatchSet and by
        #   ListByteMatchSets.
        #   @return [String]

        # @!attribute [rw] name
        #   A friendly name or description of the ByteMatchSet. You can\'t
        #   change `Name` after you create a `ByteMatchSet`.
        #   @return [String]

      end

      # In an UpdateByteMatchSet request, `ByteMatchSetUpdate` specifies
      # whether to insert or delete a ByteMatchTuple and includes the settings
      # for the `ByteMatchTuple`.
      # @note When making an API call, pass ByteMatchSetUpdate
      #   data as a hash:
      #
      #       {
      #         action: "INSERT", # required, accepts INSERT, DELETE
      #         byte_match_tuple: { # required
      #           field_to_match: { # required
      #             type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #             data: "MatchFieldData",
      #           },
      #           target_string: "data", # required
      #           text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #           positional_constraint: "EXACTLY", # required, accepts EXACTLY, STARTS_WITH, ENDS_WITH, CONTAINS, CONTAINS_WORD
      #         },
      #       }
      class ByteMatchSetUpdate < Struct.new(
        :action,
        :byte_match_tuple)

        include Aws::Structure

        # @!attribute [rw] action
        #   Specifies whether to insert or delete a ByteMatchTuple.
        #   @return [String]

        # @!attribute [rw] byte_match_tuple
        #   Information about the part of a web request that you want AWS WAF to
        #   inspect and the value that you want AWS WAF to search for. If you
        #   specify `DELETE` for the value of `Action`, the `ByteMatchTuple`
        #   values must exactly match the values in the `ByteMatchTuple` that
        #   you want to delete from the `ByteMatchSet`.
        #   @return [Types::ByteMatchTuple]

      end

      # The bytes (typically a string that corresponds with ASCII characters)
      # that you want AWS WAF to search for in web requests, the location in
      # requests that you want AWS WAF to search, and other settings.
      # @note When making an API call, pass ByteMatchTuple
      #   data as a hash:
      #
      #       {
      #         field_to_match: { # required
      #           type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #           data: "MatchFieldData",
      #         },
      #         target_string: "data", # required
      #         text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #         positional_constraint: "EXACTLY", # required, accepts EXACTLY, STARTS_WITH, ENDS_WITH, CONTAINS, CONTAINS_WORD
      #       }
      class ByteMatchTuple < Struct.new(
        :field_to_match,
        :target_string,
        :text_transformation,
        :positional_constraint)

        include Aws::Structure

        # @!attribute [rw] field_to_match
        #   The part of a web request that you want AWS WAF to search, such as a
        #   specified header or a query string. For more information, see
        #   FieldToMatch.
        #   @return [Types::FieldToMatch]

        # @!attribute [rw] target_string
        #   The value that you want AWS WAF to search for. AWS WAF searches for
        #   the specified string in the part of web requests that you specified
        #   in `FieldToMatch`. The maximum length of the value is 50 bytes.
        #
        #   Valid values depend on the values that you specified for
        #   `FieldToMatch`\:
        #
        #   * `HEADER`\: The value that you want AWS WAF to search for in the
        #     request header that you specified in FieldToMatch, for example,
        #     the value of the `User-Agent` or `Referer` header.
        #   * `METHOD`\: The HTTP method, which indicates the type of operation
        #     specified in the request. CloudFront supports the following
        #     methods: `DELETE`, `GET`, `HEAD`, `OPTIONS`, `PATCH`, `POST`, and
        #     `PUT`.
        #   * `QUERY_STRING`\: The value that you want AWS WAF to search for in
        #     the query string, which is the part of a URL that appears after a
        #     `?` character.
        #   * `URI`\: The value that you want AWS WAF to search for in the part
        #     of a URL that identifies a resource, for example,
        #     `/images/daily-ad.jpg`.
        #   * `BODY`\: The part of a request that contains any additional data
        #     that you want to send to your web server as the HTTP request body,
        #     such as data from a form. The request body immediately follows the
        #     request headers. Note that only the first `8192` bytes of the
        #     request body are forwarded to AWS WAF for inspection. To allow or
        #     block requests based on the length of the body, you can create a
        #     size constraint set. For more information, see
        #     CreateSizeConstraintSet.
        #
        #   If `TargetString` includes alphabetic characters A-Z and a-z, note
        #   that the value is case sensitive.
        #
        #   **If you\'re using the AWS WAF API**
        #
        #   Specify a base64-encoded version of the value. The maximum length of
        #   the value before you base64-encode it is 50 bytes.
        #
        #   For example, suppose the value of `Type` is `HEADER` and the value
        #   of `Data` is `User-Agent`. If you want to search the `User-Agent`
        #   header for the value `BadBot`, you base64-encode `BadBot` using MIME
        #   base64 encoding and include the resulting value, `QmFkQm90`, in the
        #   value of `TargetString`.
        #
        #   **If you\'re using the AWS CLI or one of the AWS SDKs**
        #
        #   The value that you want AWS WAF to search for. The SDK automatically
        #   base64 encodes the value.
        #   @return [String]

        # @!attribute [rw] text_transformation
        #   Text transformations eliminate some of the unusual formatting that
        #   attackers use in web requests in an effort to bypass AWS WAF. If you
        #   specify a transformation, AWS WAF performs the transformation on
        #   `TargetString` before inspecting a request for a match.
        #
        #   **CMD\_LINE**
        #
        #   When you\'re concerned that attackers are injecting an operating
        #   system commandline command and using unusual formatting to disguise
        #   some or all of the command, use this option to perform the following
        #   transformations:
        #
        #   * Delete the following characters: \\ \" \' ^
        #   * Delete spaces before the following characters: / (
        #   * Replace the following characters with a space: , ;
        #   * Replace multiple spaces with one space
        #   * Convert uppercase letters (A-Z) to lowercase (a-z)
        #
        #   **COMPRESS\_WHITE\_SPACE**
        #
        #   Use this option to replace the following characters with a space
        #   character (decimal 32):
        #
        #   * \\f, formfeed, decimal 12
        #   * \\t, tab, decimal 9
        #   * \\n, newline, decimal 10
        #   * \\r, carriage return, decimal 13
        #   * \\v, vertical tab, decimal 11
        #   * non-breaking space, decimal 160
        #
        #   `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
        #
        #   **HTML\_ENTITY\_DECODE**
        #
        #   Use this option to replace HTML-encoded characters with unencoded
        #   characters. `HTML_ENTITY_DECODE` performs the following operations:
        #
        #   * Replaces `(ampersand)quot;` with `"`
        #   * Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
        #   * Replaces `(ampersand)lt;` with a \"less than\" symbol
        #   * Replaces `(ampersand)gt;` with `>`
        #   * Replaces characters that are represented in hexadecimal format,
        #     `(ampersand)#xhhhh;`, with the corresponding characters
        #   * Replaces characters that are represented in decimal format,
        #     `(ampersand)#nnnn;`, with the corresponding characters
        #
        #   **LOWERCASE**
        #
        #   Use this option to convert uppercase letters (A-Z) to lowercase
        #   (a-z).
        #
        #   **URL\_DECODE**
        #
        #   Use this option to decode a URL-encoded value.
        #
        #   **NONE**
        #
        #   Specify `NONE` if you don\'t want to perform any text
        #   transformations.
        #   @return [String]

        # @!attribute [rw] positional_constraint
        #   Within the portion of a web request that you want to search (for
        #   example, in the query string, if any), specify where you want AWS
        #   WAF to search. Valid values include the following:
        #
        #   **CONTAINS**
        #
        #   The specified part of the web request must include the value of
        #   `TargetString`, but the location doesn\'t matter.
        #
        #   **CONTAINS\_WORD**
        #
        #   The specified part of the web request must include the value of
        #   `TargetString`, and `TargetString` must contain only alphanumeric
        #   characters or underscore (A-Z, a-z, 0-9, or \_). In addition,
        #   `TargetString` must be a word, which means one of the following:
        #
        #   * `TargetString` exactly matches the value of the specified part of
        #     the web request, such as the value of a header.
        #   * `TargetString` is at the beginning of the specified part of the
        #     web request and is followed by a character other than an
        #     alphanumeric character or underscore (\_), for example, `BadBot;`.
        #   * `TargetString` is at the end of the specified part of the web
        #     request and is preceded by a character other than an alphanumeric
        #     character or underscore (\_), for example, `;BadBot`.
        #   * `TargetString` is in the middle of the specified part of the web
        #     request and is preceded and followed by characters other than
        #     alphanumeric characters or underscore (\_), for example,
        #     `-BadBot;`.
        #
        #   **EXACTLY**
        #
        #   The value of the specified part of the web request must exactly
        #   match the value of `TargetString`.
        #
        #   **STARTS\_WITH**
        #
        #   The value of `TargetString` must appear at the beginning of the
        #   specified part of the web request.
        #
        #   **ENDS\_WITH**
        #
        #   The value of `TargetString` must appear at the end of the specified
        #   part of the web request.
        #   @return [String]

      end

      # @note When making an API call, pass CreateByteMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         name: "ResourceName", # required
      #         change_token: "ChangeToken", # required
      #       }
      class CreateByteMatchSetRequest < Struct.new(
        :name,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] name
        #   A friendly name or description of the ByteMatchSet. You can\'t
        #   change `Name` after you create a `ByteMatchSet`.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class CreateByteMatchSetResponse < Struct.new(
        :byte_match_set,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] byte_match_set
        #   A ByteMatchSet that contains no `ByteMatchTuple` objects.
        #   @return [Types::ByteMatchSet]

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `CreateByteMatchSet`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass CreateIPSetRequest
      #   data as a hash:
      #
      #       {
      #         name: "ResourceName", # required
      #         change_token: "ChangeToken", # required
      #       }
      class CreateIPSetRequest < Struct.new(
        :name,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] name
        #   A friendly name or description of the IPSet. You can\'t change
        #   `Name` after you create the `IPSet`.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class CreateIPSetResponse < Struct.new(
        :ip_set,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] ip_set
        #   The IPSet returned in the `CreateIPSet` response.
        #   @return [Types::IPSet]

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `CreateIPSet` request.
        #   You can also use this value to query the status of the request. For
        #   more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass CreateRuleRequest
      #   data as a hash:
      #
      #       {
      #         name: "ResourceName", # required
      #         metric_name: "MetricName", # required
      #         change_token: "ChangeToken", # required
      #       }
      class CreateRuleRequest < Struct.new(
        :name,
        :metric_name,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] name
        #   A friendly name or description of the Rule. You can\'t change the
        #   name of a `Rule` after you create it.
        #   @return [String]

        # @!attribute [rw] metric_name
        #   A friendly name or description for the metrics for this `Rule`. The
        #   name can contain only alphanumeric characters (A-Z, a-z, 0-9); the
        #   name can\'t contain whitespace. You can\'t change the name of the
        #   metric after you create the `Rule`.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class CreateRuleResponse < Struct.new(
        :rule,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] rule
        #   The Rule returned in the `CreateRule` response.
        #   @return [Types::Rule]

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `CreateRule` request.
        #   You can also use this value to query the status of the request. For
        #   more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass CreateSizeConstraintSetRequest
      #   data as a hash:
      #
      #       {
      #         name: "ResourceName", # required
      #         change_token: "ChangeToken", # required
      #       }
      class CreateSizeConstraintSetRequest < Struct.new(
        :name,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] name
        #   A friendly name or description of the SizeConstraintSet. You can\'t
        #   change `Name` after you create a `SizeConstraintSet`.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class CreateSizeConstraintSetResponse < Struct.new(
        :size_constraint_set,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] size_constraint_set
        #   A SizeConstraintSet that contains no `SizeConstraint` objects.
        #   @return [Types::SizeConstraintSet]

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the
        #   `CreateSizeConstraintSet` request. You can also use this value to
        #   query the status of the request. For more information, see
        #   GetChangeTokenStatus.
        #   @return [String]

      end

      # A request to create a SqlInjectionMatchSet.
      # @note When making an API call, pass CreateSqlInjectionMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         name: "ResourceName", # required
      #         change_token: "ChangeToken", # required
      #       }
      class CreateSqlInjectionMatchSetRequest < Struct.new(
        :name,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] name
        #   A friendly name or description for the SqlInjectionMatchSet that
        #   you\'re creating. You can\'t change `Name` after you create the
        #   `SqlInjectionMatchSet`.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      # The response to a `CreateSqlInjectionMatchSet` request.
      class CreateSqlInjectionMatchSetResponse < Struct.new(
        :sql_injection_match_set,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] sql_injection_match_set
        #   A SqlInjectionMatchSet.
        #   @return [Types::SqlInjectionMatchSet]

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the
        #   `CreateSqlInjectionMatchSet` request. You can also use this value to
        #   query the status of the request. For more information, see
        #   GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass CreateWebACLRequest
      #   data as a hash:
      #
      #       {
      #         name: "ResourceName", # required
      #         metric_name: "MetricName", # required
      #         default_action: { # required
      #           type: "BLOCK", # required, accepts BLOCK, ALLOW, COUNT
      #         },
      #         change_token: "ChangeToken", # required
      #       }
      class CreateWebACLRequest < Struct.new(
        :name,
        :metric_name,
        :default_action,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] name
        #   A friendly name or description of the WebACL. You can\'t change
        #   `Name` after you create the `WebACL`.
        #   @return [String]

        # @!attribute [rw] metric_name
        #   A friendly name or description for the metrics for this `WebACL`.
        #   The name can contain only alphanumeric characters (A-Z, a-z, 0-9);
        #   the name can\'t contain whitespace. You can\'t change `MetricName`
        #   after you create the `WebACL`.
        #   @return [String]

        # @!attribute [rw] default_action
        #   The action that you want AWS WAF to take when a request doesn\'t
        #   match the criteria specified in any of the `Rule` objects that are
        #   associated with the `WebACL`.
        #   @return [Types::WafAction]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class CreateWebACLResponse < Struct.new(
        :web_acl,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] web_acl
        #   The WebACL returned in the `CreateWebACL` response.
        #   @return [Types::WebACL]

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `CreateWebACL`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # A request to create an XssMatchSet.
      # @note When making an API call, pass CreateXssMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         name: "ResourceName", # required
      #         change_token: "ChangeToken", # required
      #       }
      class CreateXssMatchSetRequest < Struct.new(
        :name,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] name
        #   A friendly name or description for the XssMatchSet that you\'re
        #   creating. You can\'t change `Name` after you create the
        #   `XssMatchSet`.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      # The response to a `CreateXssMatchSet` request.
      class CreateXssMatchSetResponse < Struct.new(
        :xss_match_set,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] xss_match_set
        #   An XssMatchSet.
        #   @return [Types::XssMatchSet]

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `CreateXssMatchSet`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass DeleteByteMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         byte_match_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #       }
      class DeleteByteMatchSetRequest < Struct.new(
        :byte_match_set_id,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] byte_match_set_id
        #   The `ByteMatchSetId` of the ByteMatchSet that you want to delete.
        #   `ByteMatchSetId` is returned by CreateByteMatchSet and by
        #   ListByteMatchSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class DeleteByteMatchSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `DeleteByteMatchSet`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass DeleteIPSetRequest
      #   data as a hash:
      #
      #       {
      #         ip_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #       }
      class DeleteIPSetRequest < Struct.new(
        :ip_set_id,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] ip_set_id
        #   The `IPSetId` of the IPSet that you want to delete. `IPSetId` is
        #   returned by CreateIPSet and by ListIPSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class DeleteIPSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `DeleteIPSet` request.
        #   You can also use this value to query the status of the request. For
        #   more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass DeleteRuleRequest
      #   data as a hash:
      #
      #       {
      #         rule_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #       }
      class DeleteRuleRequest < Struct.new(
        :rule_id,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] rule_id
        #   The `RuleId` of the Rule that you want to delete. `RuleId` is
        #   returned by CreateRule and by ListRules.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class DeleteRuleResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `DeleteRule` request.
        #   You can also use this value to query the status of the request. For
        #   more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass DeleteSizeConstraintSetRequest
      #   data as a hash:
      #
      #       {
      #         size_constraint_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #       }
      class DeleteSizeConstraintSetRequest < Struct.new(
        :size_constraint_set_id,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] size_constraint_set_id
        #   The `SizeConstraintSetId` of the SizeConstraintSet that you want to
        #   delete. `SizeConstraintSetId` is returned by CreateSizeConstraintSet
        #   and by ListSizeConstraintSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class DeleteSizeConstraintSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the
        #   `DeleteSizeConstraintSet` request. You can also use this value to
        #   query the status of the request. For more information, see
        #   GetChangeTokenStatus.
        #   @return [String]

      end

      # A request to delete a SqlInjectionMatchSet from AWS WAF.
      # @note When making an API call, pass DeleteSqlInjectionMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         sql_injection_match_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #       }
      class DeleteSqlInjectionMatchSetRequest < Struct.new(
        :sql_injection_match_set_id,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] sql_injection_match_set_id
        #   The `SqlInjectionMatchSetId` of the SqlInjectionMatchSet that you
        #   want to delete. `SqlInjectionMatchSetId` is returned by
        #   CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      # The response to a request to delete a SqlInjectionMatchSet from AWS
      # WAF.
      class DeleteSqlInjectionMatchSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the
        #   `DeleteSqlInjectionMatchSet` request. You can also use this value to
        #   query the status of the request. For more information, see
        #   GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass DeleteWebACLRequest
      #   data as a hash:
      #
      #       {
      #         web_acl_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #       }
      class DeleteWebACLRequest < Struct.new(
        :web_acl_id,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] web_acl_id
        #   The `WebACLId` of the WebACL that you want to delete. `WebACLId` is
        #   returned by CreateWebACL and by ListWebACLs.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      class DeleteWebACLResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `DeleteWebACL`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # A request to delete an XssMatchSet from AWS WAF.
      # @note When making an API call, pass DeleteXssMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         xss_match_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #       }
      class DeleteXssMatchSetRequest < Struct.new(
        :xss_match_set_id,
        :change_token)

        include Aws::Structure

        # @!attribute [rw] xss_match_set_id
        #   The `XssMatchSetId` of the XssMatchSet that you want to delete.
        #   `XssMatchSetId` is returned by CreateXssMatchSet and by
        #   ListXssMatchSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

      end

      # The response to a request to delete an XssMatchSet from AWS WAF.
      class DeleteXssMatchSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `DeleteXssMatchSet`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # Specifies where in a web request to look for `TargetString`.
      # @note When making an API call, pass FieldToMatch
      #   data as a hash:
      #
      #       {
      #         type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #         data: "MatchFieldData",
      #       }
      class FieldToMatch < Struct.new(
        :type,
        :data)

        include Aws::Structure

        # @!attribute [rw] type
        #   The part of the web request that you want AWS WAF to search for a
        #   specified string. Parts of a request that you can search include the
        #   following:
        #
        #   * `HEADER`\: A specified request header, for example, the value of
        #     the `User-Agent` or `Referer` header. If you choose `HEADER` for
        #     the type, specify the name of the header in `Data`.
        #   * `METHOD`\: The HTTP method, which indicated the type of operation
        #     that the request is asking the origin to perform. Amazon
        #     CloudFront supports the following methods: `DELETE`, `GET`,
        #     `HEAD`, `OPTIONS`, `PATCH`, `POST`, and `PUT`.
        #   * `QUERY_STRING`\: A query string, which is the part of a URL that
        #     appears after a `?` character, if any.
        #   * `URI`\: The part of a web request that identifies a resource, for
        #     example, `/images/daily-ad.jpg`.
        #   * `BODY`\: The part of a request that contains any additional data
        #     that you want to send to your web server as the HTTP request body,
        #     such as data from a form. The request body immediately follows the
        #     request headers. Note that only the first `8192` bytes of the
        #     request body are forwarded to AWS WAF for inspection. To allow or
        #     block requests based on the length of the body, you can create a
        #     size constraint set. For more information, see
        #     CreateSizeConstraintSet.
        #   @return [String]

        # @!attribute [rw] data
        #   When the value of `Type` is `HEADER`, enter the name of the header
        #   that you want AWS WAF to search, for example, `User-Agent` or
        #   `Referer`. If the value of `Type` is any other value, omit `Data`.
        #
        #   The name of the header is not case sensitive.
        #   @return [String]

      end

      # @note When making an API call, pass GetByteMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         byte_match_set_id: "ResourceId", # required
      #       }
      class GetByteMatchSetRequest < Struct.new(
        :byte_match_set_id)

        include Aws::Structure

        # @!attribute [rw] byte_match_set_id
        #   The `ByteMatchSetId` of the ByteMatchSet that you want to get.
        #   `ByteMatchSetId` is returned by CreateByteMatchSet and by
        #   ListByteMatchSets.
        #   @return [String]

      end

      class GetByteMatchSetResponse < Struct.new(
        :byte_match_set)

        include Aws::Structure

        # @!attribute [rw] byte_match_set
        #   Information about the ByteMatchSet that you specified in the
        #   `GetByteMatchSet` request. For more information, see the following
        #   topics:
        #
        #   * ByteMatchSet: Contains `ByteMatchSetId`, `ByteMatchTuples`, and
        #     `Name`
        #   * `ByteMatchTuples`\: Contains an array of ByteMatchTuple objects.
        #     Each `ByteMatchTuple` object contains FieldToMatch,
        #     `PositionalConstraint`, `TargetString`, and `TextTransformation`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Types::ByteMatchSet]

      end

      # @api private
      class GetChangeTokenRequest < Aws::EmptyStructure; end

      class GetChangeTokenResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used in the request. Use this value in a
        #   `GetChangeTokenStatus` request to get the current status of the
        #   request.
        #   @return [String]

      end

      # @note When making an API call, pass GetChangeTokenStatusRequest
      #   data as a hash:
      #
      #       {
      #         change_token: "ChangeToken", # required
      #       }
      class GetChangeTokenStatusRequest < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The change token for which you want to get the status. This change
        #   token was previously returned in the `GetChangeToken` response.
        #   @return [String]

      end

      class GetChangeTokenStatusResponse < Struct.new(
        :change_token_status)

        include Aws::Structure

        # @!attribute [rw] change_token_status
        #   The status of the change token.
        #   @return [String]

      end

      # @note When making an API call, pass GetIPSetRequest
      #   data as a hash:
      #
      #       {
      #         ip_set_id: "ResourceId", # required
      #       }
      class GetIPSetRequest < Struct.new(
        :ip_set_id)

        include Aws::Structure

        # @!attribute [rw] ip_set_id
        #   The `IPSetId` of the IPSet that you want to get. `IPSetId` is
        #   returned by CreateIPSet and by ListIPSets.
        #   @return [String]

      end

      class GetIPSetResponse < Struct.new(
        :ip_set)

        include Aws::Structure

        # @!attribute [rw] ip_set
        #   Information about the IPSet that you specified in the `GetIPSet`
        #   request. For more information, see the following topics:
        #
        #   * IPSet: Contains `IPSetDescriptors`, `IPSetId`, and `Name`
        #   * `IPSetDescriptors`\: Contains an array of IPSetDescriptor objects.
        #     Each `IPSetDescriptor` object contains `Type` and `Value`
        #   @return [Types::IPSet]

      end

      # @note When making an API call, pass GetRuleRequest
      #   data as a hash:
      #
      #       {
      #         rule_id: "ResourceId", # required
      #       }
      class GetRuleRequest < Struct.new(
        :rule_id)

        include Aws::Structure

        # @!attribute [rw] rule_id
        #   The `RuleId` of the Rule that you want to get. `RuleId` is returned
        #   by CreateRule and by ListRules.
        #   @return [String]

      end

      class GetRuleResponse < Struct.new(
        :rule)

        include Aws::Structure

        # @!attribute [rw] rule
        #   Information about the Rule that you specified in the `GetRule`
        #   request. For more information, see the following topics:
        #
        #   * Rule: Contains `MetricName`, `Name`, an array of `Predicate`
        #     objects, and `RuleId`
        #   * Predicate: Each `Predicate` object contains `DataId`, `Negated`,
        #     and `Type`
        #   @return [Types::Rule]

      end

      # @note When making an API call, pass GetSampledRequestsRequest
      #   data as a hash:
      #
      #       {
      #         web_acl_id: "ResourceId", # required
      #         rule_id: "ResourceId", # required
      #         time_window: { # required
      #           start_time: Time.now, # required
      #           end_time: Time.now, # required
      #         },
      #         max_items: 1, # required
      #       }
      class GetSampledRequestsRequest < Struct.new(
        :web_acl_id,
        :rule_id,
        :time_window,
        :max_items)

        include Aws::Structure

        # @!attribute [rw] web_acl_id
        #   The `WebACLId` of the `WebACL` for which you want
        #   `GetSampledRequests` to return a sample of requests.
        #   @return [String]

        # @!attribute [rw] rule_id
        #   `RuleId` is one of two values:
        #
        #   * The `RuleId` of the `Rule` for which you want `GetSampledRequests`
        #     to return a sample of requests.
        #   * `Default_Action`, which causes `GetSampledRequests` to return a
        #     sample of the requests that didn\'t match any of the rules in the
        #     specified `WebACL`.
        #   @return [String]

        # @!attribute [rw] time_window
        #   The start date and time and the end date and time of the range for
        #   which you want `GetSampledRequests` to return a sample of requests.
        #   Specify the date and time in Unix time format (in seconds). You can
        #   specify any time range in the previous three hours.
        #   @return [Types::TimeWindow]

        # @!attribute [rw] max_items
        #   The number of requests that you want AWS WAF to return from among
        #   the first 5,000 requests that your AWS resource received during the
        #   time range. If your resource received fewer requests than the value
        #   of `MaxItems`, `GetSampledRequests` returns information about all of
        #   them.
        #   @return [Integer]

      end

      class GetSampledRequestsResponse < Struct.new(
        :sampled_requests,
        :population_size,
        :time_window)

        include Aws::Structure

        # @!attribute [rw] sampled_requests
        #   A complex type that contains detailed information about each of the
        #   requests in the sample.
        #   @return [Array<Types::SampledHTTPRequest>]

        # @!attribute [rw] population_size
        #   The total number of requests from which `GetSampledRequests` got a
        #   sample of `MaxItems` requests. If `PopulationSize` is less than
        #   `MaxItems`, the sample includes every request that your AWS resource
        #   received during the specified time range.
        #   @return [Integer]

        # @!attribute [rw] time_window
        #   Usually, `TimeWindow` is the time range that you specified in the
        #   `GetSampledRequests` request. However, if your AWS resource received
        #   more than 5,000 requests during the time range that you specified in
        #   the request, `GetSampledRequests` returns the time range for the
        #   first 5,000 requests.
        #   @return [Types::TimeWindow]

      end

      # @note When making an API call, pass GetSizeConstraintSetRequest
      #   data as a hash:
      #
      #       {
      #         size_constraint_set_id: "ResourceId", # required
      #       }
      class GetSizeConstraintSetRequest < Struct.new(
        :size_constraint_set_id)

        include Aws::Structure

        # @!attribute [rw] size_constraint_set_id
        #   The `SizeConstraintSetId` of the SizeConstraintSet that you want to
        #   get. `SizeConstraintSetId` is returned by CreateSizeConstraintSet
        #   and by ListSizeConstraintSets.
        #   @return [String]

      end

      class GetSizeConstraintSetResponse < Struct.new(
        :size_constraint_set)

        include Aws::Structure

        # @!attribute [rw] size_constraint_set
        #   Information about the SizeConstraintSet that you specified in the
        #   `GetSizeConstraintSet` request. For more information, see the
        #   following topics:
        #
        #   * SizeConstraintSet: Contains `SizeConstraintSetId`,
        #     `SizeConstraints`, and `Name`
        #   * `SizeConstraints`\: Contains an array of SizeConstraint objects.
        #     Each `SizeConstraint` object contains FieldToMatch,
        #     `TextTransformation`, `ComparisonOperator`, and `Size`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Types::SizeConstraintSet]

      end

      # A request to get a SqlInjectionMatchSet.
      # @note When making an API call, pass GetSqlInjectionMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         sql_injection_match_set_id: "ResourceId", # required
      #       }
      class GetSqlInjectionMatchSetRequest < Struct.new(
        :sql_injection_match_set_id)

        include Aws::Structure

        # @!attribute [rw] sql_injection_match_set_id
        #   The `SqlInjectionMatchSetId` of the SqlInjectionMatchSet that you
        #   want to get. `SqlInjectionMatchSetId` is returned by
        #   CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets.
        #   @return [String]

      end

      # The response to a GetSqlInjectionMatchSet request.
      class GetSqlInjectionMatchSetResponse < Struct.new(
        :sql_injection_match_set)

        include Aws::Structure

        # @!attribute [rw] sql_injection_match_set
        #   Information about the SqlInjectionMatchSet that you specified in the
        #   `GetSqlInjectionMatchSet` request. For more information, see the
        #   following topics:
        #
        #   * SqlInjectionMatchSet: Contains `Name`, `SqlInjectionMatchSetId`,
        #     and an array of `SqlInjectionMatchTuple` objects
        #   * SqlInjectionMatchTuple: Each `SqlInjectionMatchTuple` object
        #     contains `FieldToMatch` and `TextTransformation`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Types::SqlInjectionMatchSet]

      end

      # @note When making an API call, pass GetWebACLRequest
      #   data as a hash:
      #
      #       {
      #         web_acl_id: "ResourceId", # required
      #       }
      class GetWebACLRequest < Struct.new(
        :web_acl_id)

        include Aws::Structure

        # @!attribute [rw] web_acl_id
        #   The `WebACLId` of the WebACL that you want to get. `WebACLId` is
        #   returned by CreateWebACL and by ListWebACLs.
        #   @return [String]

      end

      class GetWebACLResponse < Struct.new(
        :web_acl)

        include Aws::Structure

        # @!attribute [rw] web_acl
        #   Information about the WebACL that you specified in the `GetWebACL`
        #   request. For more information, see the following topics:
        #
        #   * WebACL: Contains `DefaultAction`, `MetricName`, `Name`, an array
        #     of `Rule` objects, and `WebACLId`
        #   * `DefaultAction` (Data type is WafAction): Contains `Type`
        #   * `Rules`\: Contains an array of `ActivatedRule` objects, which
        #     contain `Action`, `Priority`, and `RuleId`
        #   * `Action`\: Contains `Type`
        #   @return [Types::WebACL]

      end

      # A request to get an XssMatchSet.
      # @note When making an API call, pass GetXssMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         xss_match_set_id: "ResourceId", # required
      #       }
      class GetXssMatchSetRequest < Struct.new(
        :xss_match_set_id)

        include Aws::Structure

        # @!attribute [rw] xss_match_set_id
        #   The `XssMatchSetId` of the XssMatchSet that you want to get.
        #   `XssMatchSetId` is returned by CreateXssMatchSet and by
        #   ListXssMatchSets.
        #   @return [String]

      end

      # The response to a GetXssMatchSet request.
      class GetXssMatchSetResponse < Struct.new(
        :xss_match_set)

        include Aws::Structure

        # @!attribute [rw] xss_match_set
        #   Information about the XssMatchSet that you specified in the
        #   `GetXssMatchSet` request. For more information, see the following
        #   topics:
        #
        #   * XssMatchSet: Contains `Name`, `XssMatchSetId`, and an array of
        #     `XssMatchTuple` objects
        #   * XssMatchTuple: Each `XssMatchTuple` object contains `FieldToMatch`
        #     and `TextTransformation`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Types::XssMatchSet]

      end

      # The response from a GetSampledRequests request includes an
      # `HTTPHeader` complex type that appears as `Headers` in the response
      # syntax. `HTTPHeader` contains the names and values of all of the
      # headers that appear in one of the web requests that were returned by
      # `GetSampledRequests`.
      class HTTPHeader < Struct.new(
        :name,
        :value)

        include Aws::Structure

        # @!attribute [rw] name
        #   The name of one of the headers in the sampled web request.
        #   @return [String]

        # @!attribute [rw] value
        #   The value of one of the headers in the sampled web request.
        #   @return [String]

      end

      # The response from a GetSampledRequests request includes an
      # `HTTPRequest` complex type that appears as `Request` in the response
      # syntax. `HTTPRequest` contains information about one of the web
      # requests that were returned by `GetSampledRequests`.
      class HTTPRequest < Struct.new(
        :client_ip,
        :country,
        :uri,
        :method,
        :http_version,
        :headers)

        include Aws::Structure

        # @!attribute [rw] client_ip
        #   The IP address that the request originated from. If the `WebACL` is
        #   associated with a CloudFront distribution, this is the value of one
        #   of the following fields in CloudFront access logs:
        #
        #   * `c-ip`, if the viewer did not use an HTTP proxy or a load balancer
        #     to send the request
        #   * `x-forwarded-for`, if the viewer did use an HTTP proxy or a load
        #     balancer to send the request
        #   @return [String]

        # @!attribute [rw] country
        #   The two-letter country code for the country that the request
        #   originated from. For a current list of country codes, see the
        #   Wikipedia entry [ISO 3166-1 alpha-2][1].
        #
        #
        #
        #   [1]: https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
        #   @return [String]

        # @!attribute [rw] uri
        #   The part of a web request that identifies the resource, for example,
        #   `/images/daily-ad.jpg`.
        #   @return [String]

        # @!attribute [rw] method
        #   The HTTP method specified in the sampled web request. CloudFront
        #   supports the following methods: `DELETE`, `GET`, `HEAD`, `OPTIONS`,
        #   `PATCH`, `POST`, and `PUT`.
        #   @return [String]

        # @!attribute [rw] http_version
        #   The HTTP version specified in the sampled web request, for example,
        #   `HTTP/1.1`.
        #   @return [String]

        # @!attribute [rw] headers
        #   A complex type that contains two values for each header in the
        #   sampled web request: the name of the header and the value of the
        #   header.
        #   @return [Array<Types::HTTPHeader>]

      end

      # Contains one or more IP addresses or blocks of IP addresses specified
      # in Classless Inter-Domain Routing (CIDR) notation. To specify an
      # individual IP address, you specify the four-part IP address followed
      # by a `/32`, for example, 192.0.2.0/31. To block a range of IP
      # addresses, you can specify a `/24`, a `/16`, or a `/8` CIDR. For more
      # information about CIDR notation, perform an Internet search on `cidr
      # notation`.
      class IPSet < Struct.new(
        :ip_set_id,
        :name,
        :ip_set_descriptors)

        include Aws::Structure

        # @!attribute [rw] ip_set_id
        #   The `IPSetId` for an `IPSet`. You use `IPSetId` to get information
        #   about an `IPSet` (see GetIPSet), update an `IPSet` (see
        #   UpdateIPSet), insert an `IPSet` into a `Rule` or delete one from a
        #   `Rule` (see UpdateRule), and delete an `IPSet` from AWS WAF (see
        #   DeleteIPSet).
        #
        #   `IPSetId` is returned by CreateIPSet and by ListIPSets.
        #   @return [String]

        # @!attribute [rw] name
        #   A friendly name or description of the IPSet. You can\'t change the
        #   name of an `IPSet` after you create it.
        #   @return [String]

        # @!attribute [rw] ip_set_descriptors
        #   The IP address type (`IPV4`) and the IP address range (in CIDR
        #   notation) that web requests originate from. If the `WebACL` is
        #   associated with a CloudFront distribution, this is the value of one
        #   of the following fields in CloudFront access logs:
        #
        #   * `c-ip`, if the viewer did not use an HTTP proxy or a load balancer
        #     to send the request
        #   * `x-forwarded-for`, if the viewer did use an HTTP proxy or a load
        #     balancer to send the request
        #   @return [Array<Types::IPSetDescriptor>]

      end

      # Specifies the IP address type (`IPV4`) and the IP address range (in
      # CIDR format) that web requests originate from.
      # @note When making an API call, pass IPSetDescriptor
      #   data as a hash:
      #
      #       {
      #         type: "IPV4", # required, accepts IPV4
      #         value: "IPSetDescriptorValue", # required
      #       }
      class IPSetDescriptor < Struct.new(
        :type,
        :value)

        include Aws::Structure

        # @!attribute [rw] type
        #   Specify `IPV4`.
        #   @return [String]

        # @!attribute [rw] value
        #   Specify an IPv4 address by using CIDR notation. For example:
        #
        #   * To configure AWS WAF to allow, block, or count requests that
        #     originated from the IP address 192.0.2.44, specify
        #     `192.0.2.44/32`.
        #   * To configure AWS WAF to allow, block, or count requests that
        #     originated from IP addresses from 192.0.2.0 to 192.0.2.255,
        #     specify `192.0.2.0/24`.
        #
        #   AWS WAF supports only /8, /16, /24, and /32 IP addresses.
        #
        #   For more information about CIDR notation, see the Wikipedia entry
        #   [Classless Inter-Domain Routing][1].
        #
        #
        #
        #   [1]: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
        #   @return [String]

      end

      # Contains the identifier and the name of the `IPSet`.
      class IPSetSummary < Struct.new(
        :ip_set_id,
        :name)

        include Aws::Structure

        # @!attribute [rw] ip_set_id
        #   The `IPSetId` for an IPSet. You can use `IPSetId` in a GetIPSet
        #   request to get detailed information about an IPSet.
        #   @return [String]

        # @!attribute [rw] name
        #   A friendly name or description of the IPSet. You can\'t change the
        #   name of an `IPSet` after you create it.
        #   @return [String]

      end

      # Specifies the type of update to perform to an IPSet with UpdateIPSet.
      # @note When making an API call, pass IPSetUpdate
      #   data as a hash:
      #
      #       {
      #         action: "INSERT", # required, accepts INSERT, DELETE
      #         ip_set_descriptor: { # required
      #           type: "IPV4", # required, accepts IPV4
      #           value: "IPSetDescriptorValue", # required
      #         },
      #       }
      class IPSetUpdate < Struct.new(
        :action,
        :ip_set_descriptor)

        include Aws::Structure

        # @!attribute [rw] action
        #   Specifies whether to insert or delete an IP address with
        #   UpdateIPSet.
        #   @return [String]

        # @!attribute [rw] ip_set_descriptor
        #   The IP address type (`IPV4`) and the IP address range (in CIDR
        #   notation) that web requests originate from.
        #   @return [Types::IPSetDescriptor]

      end

      # @note When making an API call, pass ListByteMatchSetsRequest
      #   data as a hash:
      #
      #       {
      #         next_marker: "NextMarker",
      #         limit: 1, # required
      #       }
      class ListByteMatchSetsRequest < Struct.new(
        :next_marker,
        :limit)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you specify a value for `Limit` and you have more `ByteMatchSets`
        #   than the value of `Limit`, AWS WAF returns a `NextMarker` value in
        #   the response that allows you to list another group of
        #   `ByteMatchSets`. For the second and subsequent `ListByteMatchSets`
        #   requests, specify the value of `NextMarker` from the previous
        #   response to get information about another batch of `ByteMatchSets`.
        #   @return [String]

        # @!attribute [rw] limit
        #   Specifies the number of `ByteMatchSet` objects that you want AWS WAF
        #   to return for this request. If you have more `ByteMatchSets` objects
        #   than the number you specify for `Limit`, the response includes a
        #   `NextMarker` value that you can use to get another batch of
        #   `ByteMatchSet` objects.
        #   @return [Integer]

      end

      class ListByteMatchSetsResponse < Struct.new(
        :next_marker,
        :byte_match_sets)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you have more `ByteMatchSet` objects than the number that you
        #   specified for `Limit` in the request, the response includes a
        #   `NextMarker` value. To list more `ByteMatchSet` objects, submit
        #   another `ListByteMatchSets` request, and specify the `NextMarker`
        #   value from the response in the `NextMarker` value in the next
        #   request.
        #   @return [String]

        # @!attribute [rw] byte_match_sets
        #   An array of ByteMatchSetSummary objects.
        #   @return [Array<Types::ByteMatchSetSummary>]

      end

      # @note When making an API call, pass ListIPSetsRequest
      #   data as a hash:
      #
      #       {
      #         next_marker: "NextMarker",
      #         limit: 1, # required
      #       }
      class ListIPSetsRequest < Struct.new(
        :next_marker,
        :limit)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you specify a value for `Limit` and you have more `IPSets` than
        #   the value of `Limit`, AWS WAF returns a `NextMarker` value in the
        #   response that allows you to list another group of `IPSets`. For the
        #   second and subsequent `ListIPSets` requests, specify the value of
        #   `NextMarker` from the previous response to get information about
        #   another batch of `ByteMatchSets`.
        #   @return [String]

        # @!attribute [rw] limit
        #   Specifies the number of `IPSet` objects that you want AWS WAF to
        #   return for this request. If you have more `IPSet` objects than the
        #   number you specify for `Limit`, the response includes a `NextMarker`
        #   value that you can use to get another batch of `IPSet` objects.
        #   @return [Integer]

      end

      class ListIPSetsResponse < Struct.new(
        :next_marker,
        :ip_sets)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you have more `IPSet` objects than the number that you specified
        #   for `Limit` in the request, the response includes a `NextMarker`
        #   value. To list more `IPSet` objects, submit another `ListIPSets`
        #   request, and specify the `NextMarker` value from the response in the
        #   `NextMarker` value in the next request.
        #   @return [String]

        # @!attribute [rw] ip_sets
        #   An array of IPSetSummary objects.
        #   @return [Array<Types::IPSetSummary>]

      end

      # @note When making an API call, pass ListRulesRequest
      #   data as a hash:
      #
      #       {
      #         next_marker: "NextMarker",
      #         limit: 1, # required
      #       }
      class ListRulesRequest < Struct.new(
        :next_marker,
        :limit)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you specify a value for `Limit` and you have more `Rules` than
        #   the value of `Limit`, AWS WAF returns a `NextMarker` value in the
        #   response that allows you to list another group of `Rules`. For the
        #   second and subsequent `ListRules` requests, specify the value of
        #   `NextMarker` from the previous response to get information about
        #   another batch of `Rules`.
        #   @return [String]

        # @!attribute [rw] limit
        #   Specifies the number of `Rules` that you want AWS WAF to return for
        #   this request. If you have more `Rules` than the number that you
        #   specify for `Limit`, the response includes a `NextMarker` value that
        #   you can use to get another batch of `Rules`.
        #   @return [Integer]

      end

      class ListRulesResponse < Struct.new(
        :next_marker,
        :rules)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you have more `Rules` than the number that you specified for
        #   `Limit` in the request, the response includes a `NextMarker` value.
        #   To list more `Rules`, submit another `ListRules` request, and
        #   specify the `NextMarker` value from the response in the `NextMarker`
        #   value in the next request.
        #   @return [String]

        # @!attribute [rw] rules
        #   An array of RuleSummary objects.
        #   @return [Array<Types::RuleSummary>]

      end

      # @note When making an API call, pass ListSizeConstraintSetsRequest
      #   data as a hash:
      #
      #       {
      #         next_marker: "NextMarker",
      #         limit: 1, # required
      #       }
      class ListSizeConstraintSetsRequest < Struct.new(
        :next_marker,
        :limit)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you specify a value for `Limit` and you have more
        #   `SizeConstraintSets` than the value of `Limit`, AWS WAF returns a
        #   `NextMarker` value in the response that allows you to list another
        #   group of `SizeConstraintSets`. For the second and subsequent
        #   `ListSizeConstraintSets` requests, specify the value of `NextMarker`
        #   from the previous response to get information about another batch of
        #   `SizeConstraintSets`.
        #   @return [String]

        # @!attribute [rw] limit
        #   Specifies the number of `SizeConstraintSet` objects that you want
        #   AWS WAF to return for this request. If you have more
        #   `SizeConstraintSets` objects than the number you specify for
        #   `Limit`, the response includes a `NextMarker` value that you can use
        #   to get another batch of `SizeConstraintSet` objects.
        #   @return [Integer]

      end

      class ListSizeConstraintSetsResponse < Struct.new(
        :next_marker,
        :size_constraint_sets)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you have more `SizeConstraintSet` objects than the number that
        #   you specified for `Limit` in the request, the response includes a
        #   `NextMarker` value. To list more `SizeConstraintSet` objects, submit
        #   another `ListSizeConstraintSets` request, and specify the
        #   `NextMarker` value from the response in the `NextMarker` value in
        #   the next request.
        #   @return [String]

        # @!attribute [rw] size_constraint_sets
        #   An array of SizeConstraintSetSummary objects.
        #   @return [Array<Types::SizeConstraintSetSummary>]

      end

      # A request to list the SqlInjectionMatchSet objects created by the
      # current AWS account.
      # @note When making an API call, pass ListSqlInjectionMatchSetsRequest
      #   data as a hash:
      #
      #       {
      #         next_marker: "NextMarker",
      #         limit: 1, # required
      #       }
      class ListSqlInjectionMatchSetsRequest < Struct.new(
        :next_marker,
        :limit)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you specify a value for `Limit` and you have more
        #   SqlInjectionMatchSet objects than the value of `Limit`, AWS WAF
        #   returns a `NextMarker` value in the response that allows you to list
        #   another group of `SqlInjectionMatchSets`. For the second and
        #   subsequent `ListSqlInjectionMatchSets` requests, specify the value
        #   of `NextMarker` from the previous response to get information about
        #   another batch of `SqlInjectionMatchSets`.
        #   @return [String]

        # @!attribute [rw] limit
        #   Specifies the number of SqlInjectionMatchSet objects that you want
        #   AWS WAF to return for this request. If you have more
        #   `SqlInjectionMatchSet` objects than the number you specify for
        #   `Limit`, the response includes a `NextMarker` value that you can use
        #   to get another batch of `Rules`.
        #   @return [Integer]

      end

      # The response to a ListSqlInjectionMatchSets request.
      class ListSqlInjectionMatchSetsResponse < Struct.new(
        :next_marker,
        :sql_injection_match_sets)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you have more SqlInjectionMatchSet objects than the number that
        #   you specified for `Limit` in the request, the response includes a
        #   `NextMarker` value. To list more `SqlInjectionMatchSet` objects,
        #   submit another `ListSqlInjectionMatchSets` request, and specify the
        #   `NextMarker` value from the response in the `NextMarker` value in
        #   the next request.
        #   @return [String]

        # @!attribute [rw] sql_injection_match_sets
        #   An array of SqlInjectionMatchSetSummary objects.
        #   @return [Array<Types::SqlInjectionMatchSetSummary>]

      end

      # @note When making an API call, pass ListWebACLsRequest
      #   data as a hash:
      #
      #       {
      #         next_marker: "NextMarker",
      #         limit: 1, # required
      #       }
      class ListWebACLsRequest < Struct.new(
        :next_marker,
        :limit)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you specify a value for `Limit` and you have more `WebACL`
        #   objects than the number that you specify for `Limit`, AWS WAF
        #   returns a `NextMarker` value in the response that allows you to list
        #   another group of `WebACL` objects. For the second and subsequent
        #   `ListWebACLs` requests, specify the value of `NextMarker` from the
        #   previous response to get information about another batch of `WebACL`
        #   objects.
        #   @return [String]

        # @!attribute [rw] limit
        #   Specifies the number of `WebACL` objects that you want AWS WAF to
        #   return for this request. If you have more `WebACL` objects than the
        #   number that you specify for `Limit`, the response includes a
        #   `NextMarker` value that you can use to get another batch of `WebACL`
        #   objects.
        #   @return [Integer]

      end

      class ListWebACLsResponse < Struct.new(
        :next_marker,
        :web_acls)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you have more `WebACL` objects than the number that you specified
        #   for `Limit` in the request, the response includes a `NextMarker`
        #   value. To list more `WebACL` objects, submit another `ListWebACLs`
        #   request, and specify the `NextMarker` value from the response in the
        #   `NextMarker` value in the next request.
        #   @return [String]

        # @!attribute [rw] web_acls
        #   An array of WebACLSummary objects.
        #   @return [Array<Types::WebACLSummary>]

      end

      # A request to list the XssMatchSet objects created by the current AWS
      # account.
      # @note When making an API call, pass ListXssMatchSetsRequest
      #   data as a hash:
      #
      #       {
      #         next_marker: "NextMarker",
      #         limit: 1, # required
      #       }
      class ListXssMatchSetsRequest < Struct.new(
        :next_marker,
        :limit)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you specify a value for `Limit` and you have more XssMatchSet
        #   objects than the value of `Limit`, AWS WAF returns a `NextMarker`
        #   value in the response that allows you to list another group of
        #   `XssMatchSets`. For the second and subsequent `ListXssMatchSets`
        #   requests, specify the value of `NextMarker` from the previous
        #   response to get information about another batch of `XssMatchSets`.
        #   @return [String]

        # @!attribute [rw] limit
        #   Specifies the number of XssMatchSet objects that you want AWS WAF to
        #   return for this request. If you have more `XssMatchSet` objects than
        #   the number you specify for `Limit`, the response includes a
        #   `NextMarker` value that you can use to get another batch of `Rules`.
        #   @return [Integer]

      end

      # The response to a ListXssMatchSets request.
      class ListXssMatchSetsResponse < Struct.new(
        :next_marker,
        :xss_match_sets)

        include Aws::Structure

        # @!attribute [rw] next_marker
        #   If you have more XssMatchSet objects than the number that you
        #   specified for `Limit` in the request, the response includes a
        #   `NextMarker` value. To list more `XssMatchSet` objects, submit
        #   another `ListXssMatchSets` request, and specify the `NextMarker`
        #   value from the response in the `NextMarker` value in the next
        #   request.
        #   @return [String]

        # @!attribute [rw] xss_match_sets
        #   An array of XssMatchSetSummary objects.
        #   @return [Array<Types::XssMatchSetSummary>]

      end

      # Specifies the ByteMatchSet, IPSet, SqlInjectionMatchSet, XssMatchSet,
      # and SizeConstraintSet objects that you want to add to a `Rule` and,
      # for each object, indicates whether you want to negate the settings,
      # for example, requests that do NOT originate from the IP address
      # 192.0.2.44.
      # @note When making an API call, pass Predicate
      #   data as a hash:
      #
      #       {
      #         negated: false, # required
      #         type: "IPMatch", # required, accepts IPMatch, ByteMatch, SqlInjectionMatch, SizeConstraint, XssMatch
      #         data_id: "ResourceId", # required
      #       }
      class Predicate < Struct.new(
        :negated,
        :type,
        :data_id)

        include Aws::Structure

        # @!attribute [rw] negated
        #   Set `Negated` to `False` if you want AWS WAF to allow, block, or
        #   count requests based on the settings in the specified ByteMatchSet,
        #   IPSet, SqlInjectionMatchSet, XssMatchSet, or SizeConstraintSet. For
        #   example, if an `IPSet` includes the IP address `192.0.2.44`, AWS WAF
        #   will allow or block requests based on that IP address.
        #
        #   Set `Negated` to `True` if you want AWS WAF to allow or block a
        #   request based on the negation of the settings in the ByteMatchSet,
        #   IPSet, SqlInjectionMatchSet, XssMatchSet, or SizeConstraintSet. For
        #   example, if an `IPSet` includes the IP address `192.0.2.44`, AWS WAF
        #   will allow, block, or count requests based on all IP addresses
        #   *except* `192.0.2.44`.
        #   @return [Boolean]

        # @!attribute [rw] type
        #   The type of predicate in a `Rule`, such as `ByteMatchSet` or
        #   `IPSet`.
        #   @return [String]

        # @!attribute [rw] data_id
        #   A unique identifier for a predicate in a `Rule`, such as
        #   `ByteMatchSetId` or `IPSetId`. The ID is returned by the
        #   corresponding `Create` or `List` command.
        #   @return [String]

      end

      # A combination of ByteMatchSet, IPSet, and/or SqlInjectionMatchSet
      # objects that identify the web requests that you want to allow, block,
      # or count. For example, you might create a `Rule` that includes the
      # following predicates:
      #
      # * An `IPSet` that causes AWS WAF to search for web requests that
      #   originate from the IP address `192.0.2.44`
      # * A `ByteMatchSet` that causes AWS WAF to search for web requests for
      #   which the value of the `User-Agent` header is `BadBot`.
      #
      # To match the settings in this `Rule`, a request must originate from
      # `192.0.2.44` AND include a `User-Agent` header for which the value is
      # `BadBot`.
      class Rule < Struct.new(
        :rule_id,
        :name,
        :metric_name,
        :predicates)

        include Aws::Structure

        # @!attribute [rw] rule_id
        #   A unique identifier for a `Rule`. You use `RuleId` to get more
        #   information about a `Rule` (see GetRule), update a `Rule` (see
        #   UpdateRule), insert a `Rule` into a `WebACL` or delete a one from a
        #   `WebACL` (see UpdateWebACL), or delete a `Rule` from AWS WAF (see
        #   DeleteRule).
        #
        #   `RuleId` is returned by CreateRule and by ListRules.
        #   @return [String]

        # @!attribute [rw] name
        #   The friendly name or description for the `Rule`. You can\'t change
        #   the name of a `Rule` after you create it.
        #   @return [String]

        # @!attribute [rw] metric_name
        #   @return [String]

        # @!attribute [rw] predicates
        #   The `Predicates` object contains one `Predicate` element for each
        #   ByteMatchSet, IPSet, or SqlInjectionMatchSet object that you want to
        #   include in a `Rule`.
        #   @return [Array<Types::Predicate>]

      end

      # Contains the identifier and the friendly name or description of the
      # `Rule`.
      class RuleSummary < Struct.new(
        :rule_id,
        :name)

        include Aws::Structure

        # @!attribute [rw] rule_id
        #   A unique identifier for a `Rule`. You use `RuleId` to get more
        #   information about a `Rule` (see GetRule), update a `Rule` (see
        #   UpdateRule), insert a `Rule` into a `WebACL` or delete one from a
        #   `WebACL` (see UpdateWebACL), or delete a `Rule` from AWS WAF (see
        #   DeleteRule).
        #
        #   `RuleId` is returned by CreateRule and by ListRules.
        #   @return [String]

        # @!attribute [rw] name
        #   A friendly name or description of the Rule. You can\'t change the
        #   name of a `Rule` after you create it.
        #   @return [String]

      end

      # Specifies a `Predicate` (such as an `IPSet`) and indicates whether you
      # want to add it to a `Rule` or delete it from a `Rule`.
      # @note When making an API call, pass RuleUpdate
      #   data as a hash:
      #
      #       {
      #         action: "INSERT", # required, accepts INSERT, DELETE
      #         predicate: { # required
      #           negated: false, # required
      #           type: "IPMatch", # required, accepts IPMatch, ByteMatch, SqlInjectionMatch, SizeConstraint, XssMatch
      #           data_id: "ResourceId", # required
      #         },
      #       }
      class RuleUpdate < Struct.new(
        :action,
        :predicate)

        include Aws::Structure

        # @!attribute [rw] action
        #   Specify `INSERT` to add a `Predicate` to a `Rule`. Use `DELETE` to
        #   remove a `Predicate` from a `Rule`.
        #   @return [String]

        # @!attribute [rw] predicate
        #   The ID of the `Predicate` (such as an `IPSet`) that you want to add
        #   to a `Rule`.
        #   @return [Types::Predicate]

      end

      # The response from a GetSampledRequests request includes a
      # `SampledHTTPRequests` complex type that appears as `SampledRequests`
      # in the response syntax. `SampledHTTPRequests` contains one
      # `SampledHTTPRequest` object for each web request that is returned by
      # `GetSampledRequests`.
      class SampledHTTPRequest < Struct.new(
        :request,
        :weight,
        :timestamp,
        :action)

        include Aws::Structure

        # @!attribute [rw] request
        #   A complex type that contains detailed information about the request.
        #   @return [Types::HTTPRequest]

        # @!attribute [rw] weight
        #   A value that indicates how one result in the response relates
        #   proportionally to other results in the response. A result that has a
        #   weight of `2` represents roughly twice as many CloudFront web
        #   requests as a result that has a weight of `1`.
        #   @return [Integer]

        # @!attribute [rw] timestamp
        #   The time at which AWS WAF received the request from your AWS
        #   resource, in Unix time format (in seconds).
        #   @return [Time]

        # @!attribute [rw] action
        #   The action for the `Rule` that the request matched: `ALLOW`,
        #   `BLOCK`, or `COUNT`.
        #   @return [String]

      end

      # Specifies a constraint on the size of a part of the web request. AWS
      # WAF uses the `Size`, `ComparisonOperator`, and `FieldToMatch` to build
      # an expression in the form of \"`Size` `ComparisonOperator` size in
      # bytes of `FieldToMatch`\". If that expression is true, the
      # `SizeConstraint` is considered to match.
      # @note When making an API call, pass SizeConstraint
      #   data as a hash:
      #
      #       {
      #         field_to_match: { # required
      #           type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #           data: "MatchFieldData",
      #         },
      #         text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #         comparison_operator: "EQ", # required, accepts EQ, NE, LE, LT, GE, GT
      #         size: 1, # required
      #       }
      class SizeConstraint < Struct.new(
        :field_to_match,
        :text_transformation,
        :comparison_operator,
        :size)

        include Aws::Structure

        # @!attribute [rw] field_to_match
        #   Specifies where in a web request to look for `TargetString`.
        #   @return [Types::FieldToMatch]

        # @!attribute [rw] text_transformation
        #   Text transformations eliminate some of the unusual formatting that
        #   attackers use in web requests in an effort to bypass AWS WAF. If you
        #   specify a transformation, AWS WAF performs the transformation on
        #   `FieldToMatch` before inspecting a request for a match.
        #
        #   Note that if you choose `BODY` for the value of `Type`, you must
        #   choose `NONE` for `TextTransformation` because CloudFront forwards
        #   only the first 8192 bytes for inspection.
        #
        #   **NONE**
        #
        #   Specify `NONE` if you don\'t want to perform any text
        #   transformations.
        #
        #   **CMD\_LINE**
        #
        #   When you\'re concerned that attackers are injecting an operating
        #   system command line command and using unusual formatting to disguise
        #   some or all of the command, use this option to perform the following
        #   transformations:
        #
        #   * Delete the following characters: \\ \" \' ^
        #   * Delete spaces before the following characters: / (
        #   * Replace the following characters with a space: , ;
        #   * Replace multiple spaces with one space
        #   * Convert uppercase letters (A-Z) to lowercase (a-z)
        #
        #   **COMPRESS\_WHITE\_SPACE**
        #
        #   Use this option to replace the following characters with a space
        #   character (decimal 32):
        #
        #   * \\f, formfeed, decimal 12
        #   * \\t, tab, decimal 9
        #   * \\n, newline, decimal 10
        #   * \\r, carriage return, decimal 13
        #   * \\v, vertical tab, decimal 11
        #   * non-breaking space, decimal 160
        #
        #   `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
        #
        #   **HTML\_ENTITY\_DECODE**
        #
        #   Use this option to replace HTML-encoded characters with unencoded
        #   characters. `HTML_ENTITY_DECODE` performs the following operations:
        #
        #   * Replaces `(ampersand)quot;` with `"`
        #   * Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
        #   * Replaces `(ampersand)lt;` with a \"less than\" symbol
        #   * Replaces `(ampersand)gt;` with `>`
        #   * Replaces characters that are represented in hexadecimal format,
        #     `(ampersand)#xhhhh;`, with the corresponding characters
        #   * Replaces characters that are represented in decimal format,
        #     `(ampersand)#nnnn;`, with the corresponding characters
        #
        #   **LOWERCASE**
        #
        #   Use this option to convert uppercase letters (A-Z) to lowercase
        #   (a-z).
        #
        #   **URL\_DECODE**
        #
        #   Use this option to decode a URL-encoded value.
        #   @return [String]

        # @!attribute [rw] comparison_operator
        #   The type of comparison you want AWS WAF to perform. AWS WAF uses
        #   this in combination with the provided `Size` and `FieldToMatch` to
        #   build an expression in the form of \"`Size` `ComparisonOperator`
        #   size in bytes of `FieldToMatch`\". If that expression is true, the
        #   `SizeConstraint` is considered to match.
        #
        #   **EQ**\: Used to test if the `Size` is equal to the size of the
        #   `FieldToMatch`
        #
        #   **NE**\: Used to test if the `Size` is not equal to the size of the
        #   `FieldToMatch`
        #
        #   **LE**\: Used to test if the `Size` is less than or equal to the
        #   size of the `FieldToMatch`
        #
        #   **LT**\: Used to test if the `Size` is strictly less than the size
        #   of the `FieldToMatch`
        #
        #   **GE**\: Used to test if the `Size` is greater than or equal to the
        #   size of the `FieldToMatch`
        #
        #   **GT**\: Used to test if the `Size` is strictly greater than the
        #   size of the `FieldToMatch`
        #   @return [String]

        # @!attribute [rw] size
        #   The size in bytes that you want AWS WAF to compare against the size
        #   of the specified `FieldToMatch`. AWS WAF uses this in combination
        #   with `ComparisonOperator` and `FieldToMatch` to build an expression
        #   in the form of \"`Size` `ComparisonOperator` size in bytes of
        #   `FieldToMatch`\". If that expression is true, the `SizeConstraint`
        #   is considered to match.
        #
        #   Valid values for size are 0 - 21474836480 bytes (0 - 20 GB).
        #
        #   If you specify `URI` for the value of `Type`, the / in the URI
        #   counts as one character. For example, the URI `/logo.jpg` is nine
        #   characters long.
        #   @return [Integer]

      end

      # A complex type that contains `SizeConstraint` objects, which specify
      # the parts of web requests that you want AWS WAF to inspect the size
      # of. If a `SizeConstraintSet` contains more than one `SizeConstraint`
      # object, a request only needs to match one constraint to be considered
      # a match.
      class SizeConstraintSet < Struct.new(
        :size_constraint_set_id,
        :name,
        :size_constraints)

        include Aws::Structure

        # @!attribute [rw] size_constraint_set_id
        #   A unique identifier for a `SizeConstraintSet`. You use
        #   `SizeConstraintSetId` to get information about a `SizeConstraintSet`
        #   (see GetSizeConstraintSet), update a `SizeConstraintSet` (see
        #   UpdateSizeConstraintSet), insert a `SizeConstraintSet` into a `Rule`
        #   or delete one from a `Rule` (see UpdateRule), and delete a
        #   `SizeConstraintSet` from AWS WAF (see DeleteSizeConstraintSet).
        #
        #   `SizeConstraintSetId` is returned by CreateSizeConstraintSet and by
        #   ListSizeConstraintSets.
        #   @return [String]

        # @!attribute [rw] name
        #   The name, if any, of the `SizeConstraintSet`.
        #   @return [String]

        # @!attribute [rw] size_constraints
        #   Specifies the parts of web requests that you want to inspect the
        #   size of.
        #   @return [Array<Types::SizeConstraint>]

      end

      # The `Id` and `Name` of a `SizeConstraintSet`.
      class SizeConstraintSetSummary < Struct.new(
        :size_constraint_set_id,
        :name)

        include Aws::Structure

        # @!attribute [rw] size_constraint_set_id
        #   A unique identifier for a `SizeConstraintSet`. You use
        #   `SizeConstraintSetId` to get information about a `SizeConstraintSet`
        #   (see GetSizeConstraintSet), update a `SizeConstraintSet` (see
        #   UpdateSizeConstraintSet), insert a `SizeConstraintSet` into a `Rule`
        #   or delete one from a `Rule` (see UpdateRule), and delete a
        #   `SizeConstraintSet` from AWS WAF (see DeleteSizeConstraintSet).
        #
        #   `SizeConstraintSetId` is returned by CreateSizeConstraintSet and by
        #   ListSizeConstraintSets.
        #   @return [String]

        # @!attribute [rw] name
        #   The name of the `SizeConstraintSet`, if any.
        #   @return [String]

      end

      # Specifies the part of a web request that you want to inspect the size
      # of and indicates whether you want to add the specification to a
      # SizeConstraintSet or delete it from a `SizeConstraintSet`.
      # @note When making an API call, pass SizeConstraintSetUpdate
      #   data as a hash:
      #
      #       {
      #         action: "INSERT", # required, accepts INSERT, DELETE
      #         size_constraint: { # required
      #           field_to_match: { # required
      #             type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #             data: "MatchFieldData",
      #           },
      #           text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #           comparison_operator: "EQ", # required, accepts EQ, NE, LE, LT, GE, GT
      #           size: 1, # required
      #         },
      #       }
      class SizeConstraintSetUpdate < Struct.new(
        :action,
        :size_constraint)

        include Aws::Structure

        # @!attribute [rw] action
        #   Specify `INSERT` to add a SizeConstraintSetUpdate to a
        #   SizeConstraintSet. Use `DELETE` to remove a
        #   `SizeConstraintSetUpdate` from a `SizeConstraintSet`.
        #   @return [String]

        # @!attribute [rw] size_constraint
        #   Specifies a constraint on the size of a part of the web request. AWS
        #   WAF uses the `Size`, `ComparisonOperator`, and `FieldToMatch` to
        #   build an expression in the form of \"`Size` `ComparisonOperator`
        #   size in bytes of `FieldToMatch`\". If that expression is true, the
        #   `SizeConstraint` is considered to match.
        #   @return [Types::SizeConstraint]

      end

      # A complex type that contains `SqlInjectionMatchTuple` objects, which
      # specify the parts of web requests that you want AWS WAF to inspect for
      # snippets of malicious SQL code and, if you want AWS WAF to inspect a
      # header, the name of the header. If a `SqlInjectionMatchSet` contains
      # more than one `SqlInjectionMatchTuple` object, a request needs to
      # include snippets of SQL code in only one of the specified parts of the
      # request to be considered a match.
      class SqlInjectionMatchSet < Struct.new(
        :sql_injection_match_set_id,
        :name,
        :sql_injection_match_tuples)

        include Aws::Structure

        # @!attribute [rw] sql_injection_match_set_id
        #   A unique identifier for a `SqlInjectionMatchSet`. You use
        #   `SqlInjectionMatchSetId` to get information about a
        #   `SqlInjectionMatchSet` (see GetSqlInjectionMatchSet), update a
        #   `SqlInjectionMatchSet` (see UpdateSqlInjectionMatchSet), insert a
        #   `SqlInjectionMatchSet` into a `Rule` or delete one from a `Rule`
        #   (see UpdateRule), and delete a `SqlInjectionMatchSet` from AWS WAF
        #   (see DeleteSqlInjectionMatchSet).
        #
        #   `SqlInjectionMatchSetId` is returned by CreateSqlInjectionMatchSet
        #   and by ListSqlInjectionMatchSets.
        #   @return [String]

        # @!attribute [rw] name
        #   The name, if any, of the `SqlInjectionMatchSet`.
        #   @return [String]

        # @!attribute [rw] sql_injection_match_tuples
        #   Specifies the parts of web requests that you want to inspect for
        #   snippets of malicious SQL code.
        #   @return [Array<Types::SqlInjectionMatchTuple>]

      end

      # The `Id` and `Name` of a `SqlInjectionMatchSet`.
      class SqlInjectionMatchSetSummary < Struct.new(
        :sql_injection_match_set_id,
        :name)

        include Aws::Structure

        # @!attribute [rw] sql_injection_match_set_id
        #   A unique identifier for a `SqlInjectionMatchSet`. You use
        #   `SqlInjectionMatchSetId` to get information about a
        #   `SqlInjectionMatchSet` (see GetSqlInjectionMatchSet), update a
        #   `SqlInjectionMatchSet` (see UpdateSqlInjectionMatchSet), insert a
        #   `SqlInjectionMatchSet` into a `Rule` or delete one from a `Rule`
        #   (see UpdateRule), and delete a `SqlInjectionMatchSet` from AWS WAF
        #   (see DeleteSqlInjectionMatchSet).
        #
        #   `SqlInjectionMatchSetId` is returned by CreateSqlInjectionMatchSet
        #   and by ListSqlInjectionMatchSets.
        #   @return [String]

        # @!attribute [rw] name
        #   The name of the `SqlInjectionMatchSet`, if any, specified by `Id`.
        #   @return [String]

      end

      # Specifies the part of a web request that you want to inspect for
      # snippets of malicious SQL code and indicates whether you want to add
      # the specification to a SqlInjectionMatchSet or delete it from a
      # `SqlInjectionMatchSet`.
      # @note When making an API call, pass SqlInjectionMatchSetUpdate
      #   data as a hash:
      #
      #       {
      #         action: "INSERT", # required, accepts INSERT, DELETE
      #         sql_injection_match_tuple: { # required
      #           field_to_match: { # required
      #             type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #             data: "MatchFieldData",
      #           },
      #           text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #         },
      #       }
      class SqlInjectionMatchSetUpdate < Struct.new(
        :action,
        :sql_injection_match_tuple)

        include Aws::Structure

        # @!attribute [rw] action
        #   Specify `INSERT` to add a SqlInjectionMatchSetUpdate to a
        #   SqlInjectionMatchSet. Use `DELETE` to remove a
        #   `SqlInjectionMatchSetUpdate` from a `SqlInjectionMatchSet`.
        #   @return [String]

        # @!attribute [rw] sql_injection_match_tuple
        #   Specifies the part of a web request that you want AWS WAF to inspect
        #   for snippets of malicious SQL code and, if you want AWS WAF to
        #   inspect a header, the name of the header.
        #   @return [Types::SqlInjectionMatchTuple]

      end

      # Specifies the part of a web request that you want AWS WAF to inspect
      # for snippets of malicious SQL code and, if you want AWS WAF to inspect
      # a header, the name of the header.
      # @note When making an API call, pass SqlInjectionMatchTuple
      #   data as a hash:
      #
      #       {
      #         field_to_match: { # required
      #           type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #           data: "MatchFieldData",
      #         },
      #         text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #       }
      class SqlInjectionMatchTuple < Struct.new(
        :field_to_match,
        :text_transformation)

        include Aws::Structure

        # @!attribute [rw] field_to_match
        #   Specifies where in a web request to look for `TargetString`.
        #   @return [Types::FieldToMatch]

        # @!attribute [rw] text_transformation
        #   Text transformations eliminate some of the unusual formatting that
        #   attackers use in web requests in an effort to bypass AWS WAF. If you
        #   specify a transformation, AWS WAF performs the transformation on
        #   `FieldToMatch` before inspecting a request for a match.
        #
        #   **CMD\_LINE**
        #
        #   When you\'re concerned that attackers are injecting an operating
        #   system commandline command and using unusual formatting to disguise
        #   some or all of the command, use this option to perform the following
        #   transformations:
        #
        #   * Delete the following characters: \\ \" \' ^
        #   * Delete spaces before the following characters: / (
        #   * Replace the following characters with a space: , ;
        #   * Replace multiple spaces with one space
        #   * Convert uppercase letters (A-Z) to lowercase (a-z)
        #
        #   **COMPRESS\_WHITE\_SPACE**
        #
        #   Use this option to replace the following characters with a space
        #   character (decimal 32):
        #
        #   * \\f, formfeed, decimal 12
        #   * \\t, tab, decimal 9
        #   * \\n, newline, decimal 10
        #   * \\r, carriage return, decimal 13
        #   * \\v, vertical tab, decimal 11
        #   * non-breaking space, decimal 160
        #
        #   `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
        #
        #   **HTML\_ENTITY\_DECODE**
        #
        #   Use this option to replace HTML-encoded characters with unencoded
        #   characters. `HTML_ENTITY_DECODE` performs the following operations:
        #
        #   * Replaces `(ampersand)quot;` with `"`
        #   * Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
        #   * Replaces `(ampersand)lt;` with a \"less than\" symbol
        #   * Replaces `(ampersand)gt;` with `>`
        #   * Replaces characters that are represented in hexadecimal format,
        #     `(ampersand)#xhhhh;`, with the corresponding characters
        #   * Replaces characters that are represented in decimal format,
        #     `(ampersand)#nnnn;`, with the corresponding characters
        #
        #   **LOWERCASE**
        #
        #   Use this option to convert uppercase letters (A-Z) to lowercase
        #   (a-z).
        #
        #   **URL\_DECODE**
        #
        #   Use this option to decode a URL-encoded value.
        #
        #   **NONE**
        #
        #   Specify `NONE` if you don\'t want to perform any text
        #   transformations.
        #   @return [String]

      end

      # In a GetSampledRequests request, the `StartTime` and `EndTime` objects
      # specify the time range for which you want AWS WAF to return a sample
      # of web requests.
      #
      # In a GetSampledRequests response, the `StartTime` and `EndTime`
      # objects specify the time range for which AWS WAF actually returned a
      # sample of web requests. AWS WAF gets the specified number of requests
      # from among the first 5,000 requests that your AWS resource receives
      # during the specified time period. If your resource receives more than
      # 5,000 requests during that period, AWS WAF stops sampling after the
      # 5,000th request. In that case, `EndTime` is the time that AWS WAF
      # received the 5,000th request.
      # @note When making an API call, pass TimeWindow
      #   data as a hash:
      #
      #       {
      #         start_time: Time.now, # required
      #         end_time: Time.now, # required
      #       }
      class TimeWindow < Struct.new(
        :start_time,
        :end_time)

        include Aws::Structure

        # @!attribute [rw] start_time
        #   The beginning of the time range from which you want
        #   `GetSampledRequests` to return a sample of the requests that your
        #   AWS resource received. You can specify any time range in the
        #   previous three hours.
        #   @return [Time]

        # @!attribute [rw] end_time
        #   The end of the time range from which you want `GetSampledRequests`
        #   to return a sample of the requests that your AWS resource received.
        #   You can specify any time range in the previous three hours.
        #   @return [Time]

      end

      # @note When making an API call, pass UpdateByteMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         byte_match_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #         updates: [ # required
      #           {
      #             action: "INSERT", # required, accepts INSERT, DELETE
      #             byte_match_tuple: { # required
      #               field_to_match: { # required
      #                 type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #                 data: "MatchFieldData",
      #               },
      #               target_string: "data", # required
      #               text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #               positional_constraint: "EXACTLY", # required, accepts EXACTLY, STARTS_WITH, ENDS_WITH, CONTAINS, CONTAINS_WORD
      #             },
      #           },
      #         ],
      #       }
      class UpdateByteMatchSetRequest < Struct.new(
        :byte_match_set_id,
        :change_token,
        :updates)

        include Aws::Structure

        # @!attribute [rw] byte_match_set_id
        #   The `ByteMatchSetId` of the ByteMatchSet that you want to update.
        #   `ByteMatchSetId` is returned by CreateByteMatchSet and by
        #   ListByteMatchSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

        # @!attribute [rw] updates
        #   An array of `ByteMatchSetUpdate` objects that you want to insert
        #   into or delete from a ByteMatchSet. For more information, see the
        #   applicable data types:
        #
        #   * ByteMatchSetUpdate: Contains `Action` and `ByteMatchTuple`
        #   * ByteMatchTuple: Contains `FieldToMatch`, `PositionalConstraint`,
        #     `TargetString`, and `TextTransformation`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Array<Types::ByteMatchSetUpdate>]

      end

      class UpdateByteMatchSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `UpdateByteMatchSet`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass UpdateIPSetRequest
      #   data as a hash:
      #
      #       {
      #         ip_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #         updates: [ # required
      #           {
      #             action: "INSERT", # required, accepts INSERT, DELETE
      #             ip_set_descriptor: { # required
      #               type: "IPV4", # required, accepts IPV4
      #               value: "IPSetDescriptorValue", # required
      #             },
      #           },
      #         ],
      #       }
      class UpdateIPSetRequest < Struct.new(
        :ip_set_id,
        :change_token,
        :updates)

        include Aws::Structure

        # @!attribute [rw] ip_set_id
        #   The `IPSetId` of the IPSet that you want to update. `IPSetId` is
        #   returned by CreateIPSet and by ListIPSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

        # @!attribute [rw] updates
        #   An array of `IPSetUpdate` objects that you want to insert into or
        #   delete from an IPSet. For more information, see the applicable data
        #   types:
        #
        #   * IPSetUpdate: Contains `Action` and `IPSetDescriptor`
        #   * IPSetDescriptor: Contains `Type` and `Value`
        #   @return [Array<Types::IPSetUpdate>]

      end

      class UpdateIPSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `UpdateIPSet` request.
        #   You can also use this value to query the status of the request. For
        #   more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass UpdateRuleRequest
      #   data as a hash:
      #
      #       {
      #         rule_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #         updates: [ # required
      #           {
      #             action: "INSERT", # required, accepts INSERT, DELETE
      #             predicate: { # required
      #               negated: false, # required
      #               type: "IPMatch", # required, accepts IPMatch, ByteMatch, SqlInjectionMatch, SizeConstraint, XssMatch
      #               data_id: "ResourceId", # required
      #             },
      #           },
      #         ],
      #       }
      class UpdateRuleRequest < Struct.new(
        :rule_id,
        :change_token,
        :updates)

        include Aws::Structure

        # @!attribute [rw] rule_id
        #   The `RuleId` of the `Rule` that you want to update. `RuleId` is
        #   returned by `CreateRule` and by ListRules.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

        # @!attribute [rw] updates
        #   An array of `RuleUpdate` objects that you want to insert into or
        #   delete from a Rule. For more information, see the applicable data
        #   types:
        #
        #   * RuleUpdate: Contains `Action` and `Predicate`
        #   * Predicate: Contains `DataId`, `Negated`, and `Type`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Array<Types::RuleUpdate>]

      end

      class UpdateRuleResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `UpdateRule` request.
        #   You can also use this value to query the status of the request. For
        #   more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass UpdateSizeConstraintSetRequest
      #   data as a hash:
      #
      #       {
      #         size_constraint_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #         updates: [ # required
      #           {
      #             action: "INSERT", # required, accepts INSERT, DELETE
      #             size_constraint: { # required
      #               field_to_match: { # required
      #                 type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #                 data: "MatchFieldData",
      #               },
      #               text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #               comparison_operator: "EQ", # required, accepts EQ, NE, LE, LT, GE, GT
      #               size: 1, # required
      #             },
      #           },
      #         ],
      #       }
      class UpdateSizeConstraintSetRequest < Struct.new(
        :size_constraint_set_id,
        :change_token,
        :updates)

        include Aws::Structure

        # @!attribute [rw] size_constraint_set_id
        #   The `SizeConstraintSetId` of the SizeConstraintSet that you want to
        #   update. `SizeConstraintSetId` is returned by CreateSizeConstraintSet
        #   and by ListSizeConstraintSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

        # @!attribute [rw] updates
        #   An array of `SizeConstraintSetUpdate` objects that you want to
        #   insert into or delete from a SizeConstraintSet. For more
        #   information, see the applicable data types:
        #
        #   * SizeConstraintSetUpdate: Contains `Action` and `SizeConstraint`
        #   * SizeConstraint: Contains `FieldToMatch`, `TextTransformation`,
        #     `ComparisonOperator`, and `Size`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Array<Types::SizeConstraintSetUpdate>]

      end

      class UpdateSizeConstraintSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the
        #   `UpdateSizeConstraintSet` request. You can also use this value to
        #   query the status of the request. For more information, see
        #   GetChangeTokenStatus.
        #   @return [String]

      end

      # A request to update a SqlInjectionMatchSet.
      # @note When making an API call, pass UpdateSqlInjectionMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         sql_injection_match_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #         updates: [ # required
      #           {
      #             action: "INSERT", # required, accepts INSERT, DELETE
      #             sql_injection_match_tuple: { # required
      #               field_to_match: { # required
      #                 type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #                 data: "MatchFieldData",
      #               },
      #               text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #             },
      #           },
      #         ],
      #       }
      class UpdateSqlInjectionMatchSetRequest < Struct.new(
        :sql_injection_match_set_id,
        :change_token,
        :updates)

        include Aws::Structure

        # @!attribute [rw] sql_injection_match_set_id
        #   The `SqlInjectionMatchSetId` of the `SqlInjectionMatchSet` that you
        #   want to update. `SqlInjectionMatchSetId` is returned by
        #   CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

        # @!attribute [rw] updates
        #   An array of `SqlInjectionMatchSetUpdate` objects that you want to
        #   insert into or delete from a SqlInjectionMatchSet. For more
        #   information, see the applicable data types:
        #
        #   * SqlInjectionMatchSetUpdate: Contains `Action` and
        #     `SqlInjectionMatchTuple`
        #   * SqlInjectionMatchTuple: Contains `FieldToMatch` and
        #     `TextTransformation`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Array<Types::SqlInjectionMatchSetUpdate>]

      end

      # The response to an UpdateSqlInjectionMatchSets request.
      class UpdateSqlInjectionMatchSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the
        #   `UpdateSqlInjectionMatchSet` request. You can also use this value to
        #   query the status of the request. For more information, see
        #   GetChangeTokenStatus.
        #   @return [String]

      end

      # @note When making an API call, pass UpdateWebACLRequest
      #   data as a hash:
      #
      #       {
      #         web_acl_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #         updates: [
      #           {
      #             action: "INSERT", # required, accepts INSERT, DELETE
      #             activated_rule: { # required
      #               priority: 1, # required
      #               rule_id: "ResourceId", # required
      #               action: { # required
      #                 type: "BLOCK", # required, accepts BLOCK, ALLOW, COUNT
      #               },
      #             },
      #           },
      #         ],
      #         default_action: {
      #           type: "BLOCK", # required, accepts BLOCK, ALLOW, COUNT
      #         },
      #       }
      class UpdateWebACLRequest < Struct.new(
        :web_acl_id,
        :change_token,
        :updates,
        :default_action)

        include Aws::Structure

        # @!attribute [rw] web_acl_id
        #   The `WebACLId` of the WebACL that you want to update. `WebACLId` is
        #   returned by CreateWebACL and by ListWebACLs.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

        # @!attribute [rw] updates
        #   An array of updates to make to the WebACL.
        #
        #   An array of `WebACLUpdate` objects that you want to insert into or
        #   delete from a WebACL. For more information, see the applicable data
        #   types:
        #
        #   * WebACLUpdate: Contains `Action` and `ActivatedRule`
        #   * ActivatedRule: Contains `Action`, `Priority`, and `RuleId`
        #   * WafAction: Contains `Type`
        #   @return [Array<Types::WebACLUpdate>]

        # @!attribute [rw] default_action
        #   For the action that is associated with a rule in a `WebACL`,
        #   specifies the action that you want AWS WAF to perform when a web
        #   request matches all of the conditions in a rule. For the default
        #   action in a `WebACL`, specifies the action that you want AWS WAF to
        #   take when a web request doesn\'t match all of the conditions in any
        #   of the rules in a `WebACL`.
        #   @return [Types::WafAction]

      end

      class UpdateWebACLResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `UpdateWebACL`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # A request to update an XssMatchSet.
      # @note When making an API call, pass UpdateXssMatchSetRequest
      #   data as a hash:
      #
      #       {
      #         xss_match_set_id: "ResourceId", # required
      #         change_token: "ChangeToken", # required
      #         updates: [ # required
      #           {
      #             action: "INSERT", # required, accepts INSERT, DELETE
      #             xss_match_tuple: { # required
      #               field_to_match: { # required
      #                 type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #                 data: "MatchFieldData",
      #               },
      #               text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #             },
      #           },
      #         ],
      #       }
      class UpdateXssMatchSetRequest < Struct.new(
        :xss_match_set_id,
        :change_token,
        :updates)

        include Aws::Structure

        # @!attribute [rw] xss_match_set_id
        #   The `XssMatchSetId` of the `XssMatchSet` that you want to update.
        #   `XssMatchSetId` is returned by CreateXssMatchSet and by
        #   ListXssMatchSets.
        #   @return [String]

        # @!attribute [rw] change_token
        #   The value returned by the most recent call to GetChangeToken.
        #   @return [String]

        # @!attribute [rw] updates
        #   An array of `XssMatchSetUpdate` objects that you want to insert into
        #   or delete from a XssMatchSet. For more information, see the
        #   applicable data types:
        #
        #   * XssMatchSetUpdate: Contains `Action` and `XssMatchTuple`
        #   * XssMatchTuple: Contains `FieldToMatch` and `TextTransformation`
        #   * FieldToMatch: Contains `Data` and `Type`
        #   @return [Array<Types::XssMatchSetUpdate>]

      end

      # The response to an UpdateXssMatchSets request.
      class UpdateXssMatchSetResponse < Struct.new(
        :change_token)

        include Aws::Structure

        # @!attribute [rw] change_token
        #   The `ChangeToken` that you used to submit the `UpdateXssMatchSet`
        #   request. You can also use this value to query the status of the
        #   request. For more information, see GetChangeTokenStatus.
        #   @return [String]

      end

      # For the action that is associated with a rule in a `WebACL`, specifies
      # the action that you want AWS WAF to perform when a web request matches
      # all of the conditions in a rule. For the default action in a `WebACL`,
      # specifies the action that you want AWS WAF to take when a web request
      # doesn\'t match all of the conditions in any of the rules in a
      # `WebACL`.
      # @note When making an API call, pass WafAction
      #   data as a hash:
      #
      #       {
      #         type: "BLOCK", # required, accepts BLOCK, ALLOW, COUNT
      #       }
      class WafAction < Struct.new(
        :type)

        include Aws::Structure

        # @!attribute [rw] type
        #   Specifies how you want AWS WAF to respond to requests that match the
        #   settings in a `Rule`. Valid settings include the following:
        #
        #   * `ALLOW`\: AWS WAF allows requests
        #   * `BLOCK`\: AWS WAF blocks requests
        #   * `COUNT`\: AWS WAF increments a counter of the requests that match
        #     all of the conditions in the rule. AWS WAF then continues to
        #     inspect the web request based on the remaining rules in the web
        #     ACL. You can\'t specify `COUNT` for the default action for a
        #     `WebACL`.
        #   @return [String]

      end

      # Contains the `Rules` that identify the requests that you want to
      # allow, block, or count. In a `WebACL`, you also specify a default
      # action (`ALLOW` or `BLOCK`), and the action for each `Rule` that you
      # add to a `WebACL`, for example, block requests from specified IP
      # addresses or block requests from specified referrers. You also
      # associate the `WebACL` with a CloudFront distribution to identify the
      # requests that you want AWS WAF to filter. If you add more than one
      # `Rule` to a `WebACL`, a request needs to match only one of the
      # specifications to be allowed, blocked, or counted. For more
      # information, see UpdateWebACL.
      class WebACL < Struct.new(
        :web_acl_id,
        :name,
        :metric_name,
        :default_action,
        :rules)

        include Aws::Structure

        # @!attribute [rw] web_acl_id
        #   A unique identifier for a `WebACL`. You use `WebACLId` to get
        #   information about a `WebACL` (see GetWebACL), update a `WebACL` (see
        #   UpdateWebACL), and delete a `WebACL` from AWS WAF (see
        #   DeleteWebACL).
        #
        #   `WebACLId` is returned by CreateWebACL and by ListWebACLs.
        #   @return [String]

        # @!attribute [rw] name
        #   A friendly name or description of the `WebACL`. You can\'t change
        #   the name of a `WebACL` after you create it.
        #   @return [String]

        # @!attribute [rw] metric_name
        #   @return [String]

        # @!attribute [rw] default_action
        #   The action to perform if none of the `Rules` contained in the
        #   `WebACL` match. The action is specified by the WafAction object.
        #   @return [Types::WafAction]

        # @!attribute [rw] rules
        #   An array that contains the action for each `Rule` in a `WebACL`, the
        #   priority of the `Rule`, and the ID of the `Rule`.
        #   @return [Array<Types::ActivatedRule>]

      end

      # Contains the identifier and the name or description of the WebACL.
      class WebACLSummary < Struct.new(
        :web_acl_id,
        :name)

        include Aws::Structure

        # @!attribute [rw] web_acl_id
        #   A unique identifier for a `WebACL`. You use `WebACLId` to get
        #   information about a `WebACL` (see GetWebACL), update a `WebACL` (see
        #   UpdateWebACL), and delete a `WebACL` from AWS WAF (see
        #   DeleteWebACL).
        #
        #   `WebACLId` is returned by CreateWebACL and by ListWebACLs.
        #   @return [String]

        # @!attribute [rw] name
        #   A friendly name or description of the WebACL. You can\'t change the
        #   name of a `WebACL` after you create it.
        #   @return [String]

      end

      # Specifies whether to insert a `Rule` into or delete a `Rule` from a
      # `WebACL`.
      # @note When making an API call, pass WebACLUpdate
      #   data as a hash:
      #
      #       {
      #         action: "INSERT", # required, accepts INSERT, DELETE
      #         activated_rule: { # required
      #           priority: 1, # required
      #           rule_id: "ResourceId", # required
      #           action: { # required
      #             type: "BLOCK", # required, accepts BLOCK, ALLOW, COUNT
      #           },
      #         },
      #       }
      class WebACLUpdate < Struct.new(
        :action,
        :activated_rule)

        include Aws::Structure

        # @!attribute [rw] action
        #   Specifies whether to insert a `Rule` into or delete a `Rule` from a
        #   `WebACL`.
        #   @return [String]

        # @!attribute [rw] activated_rule
        #   The `ActivatedRule` object in an UpdateWebACL request specifies a
        #   `Rule` that you want to insert or delete, the priority of the `Rule`
        #   in the `WebACL`, and the action that you want AWS WAF to take when a
        #   web request matches the `Rule` (`ALLOW`, `BLOCK`, or `COUNT`).
        #
        #   To specify whether to insert or delete a `Rule`, use the `Action`
        #   parameter in the WebACLUpdate data type.
        #   @return [Types::ActivatedRule]

      end

      # A complex type that contains `XssMatchTuple` objects, which specify
      # the parts of web requests that you want AWS WAF to inspect for
      # cross-site scripting attacks and, if you want AWS WAF to inspect a
      # header, the name of the header. If a `XssMatchSet` contains more than
      # one `XssMatchTuple` object, a request needs to include cross-site
      # scripting attacks in only one of the specified parts of the request to
      # be considered a match.
      class XssMatchSet < Struct.new(
        :xss_match_set_id,
        :name,
        :xss_match_tuples)

        include Aws::Structure

        # @!attribute [rw] xss_match_set_id
        #   A unique identifier for an `XssMatchSet`. You use `XssMatchSetId` to
        #   get information about an `XssMatchSet` (see GetXssMatchSet), update
        #   an `XssMatchSet` (see UpdateXssMatchSet), insert an `XssMatchSet`
        #   into a `Rule` or delete one from a `Rule` (see UpdateRule), and
        #   delete an `XssMatchSet` from AWS WAF (see DeleteXssMatchSet).
        #
        #   `XssMatchSetId` is returned by CreateXssMatchSet and by
        #   ListXssMatchSets.
        #   @return [String]

        # @!attribute [rw] name
        #   The name, if any, of the `XssMatchSet`.
        #   @return [String]

        # @!attribute [rw] xss_match_tuples
        #   Specifies the parts of web requests that you want to inspect for
        #   cross-site scripting attacks.
        #   @return [Array<Types::XssMatchTuple>]

      end

      # The `Id` and `Name` of an `XssMatchSet`.
      class XssMatchSetSummary < Struct.new(
        :xss_match_set_id,
        :name)

        include Aws::Structure

        # @!attribute [rw] xss_match_set_id
        #   A unique identifier for an `XssMatchSet`. You use `XssMatchSetId` to
        #   get information about a `XssMatchSet` (see GetXssMatchSet), update
        #   an `XssMatchSet` (see UpdateXssMatchSet), insert an `XssMatchSet`
        #   into a `Rule` or delete one from a `Rule` (see UpdateRule), and
        #   delete an `XssMatchSet` from AWS WAF (see DeleteXssMatchSet).
        #
        #   `XssMatchSetId` is returned by CreateXssMatchSet and by
        #   ListXssMatchSets.
        #   @return [String]

        # @!attribute [rw] name
        #   The name of the `XssMatchSet`, if any, specified by `Id`.
        #   @return [String]

      end

      # Specifies the part of a web request that you want to inspect for
      # cross-site scripting attacks and indicates whether you want to add the
      # specification to an XssMatchSet or delete it from an `XssMatchSet`.
      # @note When making an API call, pass XssMatchSetUpdate
      #   data as a hash:
      #
      #       {
      #         action: "INSERT", # required, accepts INSERT, DELETE
      #         xss_match_tuple: { # required
      #           field_to_match: { # required
      #             type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #             data: "MatchFieldData",
      #           },
      #           text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #         },
      #       }
      class XssMatchSetUpdate < Struct.new(
        :action,
        :xss_match_tuple)

        include Aws::Structure

        # @!attribute [rw] action
        #   Specify `INSERT` to add a XssMatchSetUpdate to an XssMatchSet. Use
        #   `DELETE` to remove a `XssMatchSetUpdate` from an `XssMatchSet`.
        #   @return [String]

        # @!attribute [rw] xss_match_tuple
        #   Specifies the part of a web request that you want AWS WAF to inspect
        #   for cross-site scripting attacks and, if you want AWS WAF to inspect
        #   a header, the name of the header.
        #   @return [Types::XssMatchTuple]

      end

      # Specifies the part of a web request that you want AWS WAF to inspect
      # for cross-site scripting attacks and, if you want AWS WAF to inspect a
      # header, the name of the header.
      # @note When making an API call, pass XssMatchTuple
      #   data as a hash:
      #
      #       {
      #         field_to_match: { # required
      #           type: "URI", # required, accepts URI, QUERY_STRING, HEADER, METHOD, BODY
      #           data: "MatchFieldData",
      #         },
      #         text_transformation: "NONE", # required, accepts NONE, COMPRESS_WHITE_SPACE, HTML_ENTITY_DECODE, LOWERCASE, CMD_LINE, URL_DECODE
      #       }
      class XssMatchTuple < Struct.new(
        :field_to_match,
        :text_transformation)

        include Aws::Structure

        # @!attribute [rw] field_to_match
        #   Specifies where in a web request to look for `TargetString`.
        #   @return [Types::FieldToMatch]

        # @!attribute [rw] text_transformation
        #   Text transformations eliminate some of the unusual formatting that
        #   attackers use in web requests in an effort to bypass AWS WAF. If you
        #   specify a transformation, AWS WAF performs the transformation on
        #   `FieldToMatch` before inspecting a request for a match.
        #
        #   **CMD\_LINE**
        #
        #   When you\'re concerned that attackers are injecting an operating
        #   system commandline command and using unusual formatting to disguise
        #   some or all of the command, use this option to perform the following
        #   transformations:
        #
        #   * Delete the following characters: \\ \" \' ^
        #   * Delete spaces before the following characters: / (
        #   * Replace the following characters with a space: , ;
        #   * Replace multiple spaces with one space
        #   * Convert uppercase letters (A-Z) to lowercase (a-z)
        #
        #   **COMPRESS\_WHITE\_SPACE**
        #
        #   Use this option to replace the following characters with a space
        #   character (decimal 32):
        #
        #   * \\f, formfeed, decimal 12
        #   * \\t, tab, decimal 9
        #   * \\n, newline, decimal 10
        #   * \\r, carriage return, decimal 13
        #   * \\v, vertical tab, decimal 11
        #   * non-breaking space, decimal 160
        #
        #   `COMPRESS_WHITE_SPACE` also replaces multiple spaces with one space.
        #
        #   **HTML\_ENTITY\_DECODE**
        #
        #   Use this option to replace HTML-encoded characters with unencoded
        #   characters. `HTML_ENTITY_DECODE` performs the following operations:
        #
        #   * Replaces `(ampersand)quot;` with `"`
        #   * Replaces `(ampersand)nbsp;` with a non-breaking space, decimal 160
        #   * Replaces `(ampersand)lt;` with a \"less than\" symbol
        #   * Replaces `(ampersand)gt;` with `>`
        #   * Replaces characters that are represented in hexadecimal format,
        #     `(ampersand)#xhhhh;`, with the corresponding characters
        #   * Replaces characters that are represented in decimal format,
        #     `(ampersand)#nnnn;`, with the corresponding characters
        #
        #   **LOWERCASE**
        #
        #   Use this option to convert uppercase letters (A-Z) to lowercase
        #   (a-z).
        #
        #   **URL\_DECODE**
        #
        #   Use this option to decode a URL-encoded value.
        #
        #   **NONE**
        #
        #   Specify `NONE` if you don\'t want to perform any text
        #   transformations.
        #   @return [String]

      end

    end
  end
end