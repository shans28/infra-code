#s3
variable "s3_app_data_bucket_name" {
  default = "s3-dev-core-001-app-data"
}
variable "s3_app_data_bucket_force_destroy" {
  default = false
}
variable "s3_app_data_tags" {
  default = null
}
variable "s3_app_data_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_app_data_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_app_data_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_app_data_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_app_data_restrict_public_buckets" {
  default  = true
  type     = bool
}

variable "s3_app_data_versioning" {
  default = true
  type    = bool
}

variable "s3_app_data_server_access_logging_target_prefix"{
  default     = "app-data-logs/"
  type        = string
  description = " A prefix for all log object keys."
}



variable "s3_infra_logs_bucket_name" {
  default = "s3-dev-core-001-infra-logs"
}
variable "s3_infra_logs_bucket_force_destroy" {
  default = false
}
variable "s3_infra_logs_tags" {
  default = null
}
variable "s3_infra_logs_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_infra_logs_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_infra_logs_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_infra_logs_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_infra_logs_restrict_public_buckets" {
  default  = true
  type     = bool
}

variable "s3_infra_logs_server_access_logging_target_prefix"{
  default     = "infra-logs-logs/"
  type        = string
  description = " A prefix for all log object keys."
}


variable "s3_video_analytics_bucket_name" {
  default = "s3-dev-core-001-video-analytics"
}
variable "s3_video_analytics_bucket_force_destroy" {
  default = false
}
variable "s3_video_analytics_tags" {
  default = null
}
variable "s3_video_analytics_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_video_analytics_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_video_analytics_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_video_analytics_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_video_analytics_restrict_public_buckets" {
  default  = true
  type     = bool
}
variable "s3_video_analytics_versioning" {
  default = true
  type    = bool
}

variable "s3_video_analytics_server_access_logging_target_prefix"{
  default     = "video-analytics-logs/"
  type        = string
  description = " A prefix for all log object keys."
}

variable "s3_codepipeline_artifact_bucket_name" {
  default = "s3-dev-core-001-codepipeline-artifact"
}
variable "s3_codepipeline_artifact_bucket_force_destroy" {
  default = false
}
variable "s3_codepipeline_artifact_tags" {
  default = null
}
variable "s3_codepipeline_artifact_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_codepipeline_artifact_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_codepipeline_artifact_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_codepipeline_artifact_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_codepipeline_artifact_restrict_public_buckets" {
  default  = true
  type     = bool
}
variable "s3_codepipeline_artifact_policy" {
  default  = null
  type     = string
}

variable "s3_codepipeline_artifact_server_access_logging_target_prefix"{
  default     = "codepipeline-artifact-logs/"
  type        = string
  description = " A prefix for all log object keys."
}


variable "s3_review_app_data_bucket_name" {
  default = "s3-dev-core-001-review-app-data"
}
variable "s3_review_app_data_bucket_force_destroy" {
  default = false
}
variable "s3_review_app_data_tags" {
  default = null
}
variable "s3_review_app_data_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_review_app_data_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_review_app_data_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_review_app_data_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_review_app_data_restrict_public_buckets" {
  default  = true
  type     = bool
}


variable "s3_event_notification_eventbridge_enabled" {
  default = false
  type = bool
}
variable "s3_event_notification_call_transcribe_for_all_speaker_at_one_audio_events" {
  default = ["s3:ObjectCreated:*"]
  type = list(string)
}
variable "s3_event_notification_call_transcribe_for_all_speaker_at_one_audio_filter_prefix" {
  default = "composed_recordings/"
  type = string
}
variable "s3_event_notification_call_transcribe_for_all_speaker_at_one_audio_id" {
  default = "call-transcribe-mp3-to-json"
  type = string
}
variable "s3_event_notification_call_transcribe_for_all_speaker_at_one_audio_filter_suffix" {
  default = ".webm"
  type = string
}


variable "s3_event_notification_fetch_twilio_room_id_events" {
  default = ["s3:ObjectCreated:*"]
  type = list(string)
}
variable "s3_event_notification_fetch_twilio_room_id_filter_prefix" {
  default = "dump_from_twilio/"
  type = string
}
variable "s3_event_notification_fetch_twilio_room_id_id" {
  default = "fetch_room_id_for_twilio_composed_video"
  type = string
}
variable "s3_event_notification_fetch_twilio_room_id_filter_suffix" {
  default = ".webm"
  type = string
}



variable "s3_event_notification_parse_composed_json_to_table_events" {
  default = ["s3:ObjectCreated:*"]
  type = list(string)
}
variable "s3_event_notification_parse_composed_json_to_table_filter_prefix" {
  default = "composed_recordings/"
  type = string
}
variable "s3_event_notification_parse_composed_json_to_table_id" {
  default = "on-json-call-parse-to-table\t"
  type = string
}
variable "s3_event_notification_parse_composed_json_to_table_filter_suffix" {
  default = ".json"
  type = string
}


variable "s3_app_data_sse_configuration_sse_s3_algorithm" {
  default = "AES256"
  type = string
  
}
variable "s3_infra_logs_sse_configuration_sse_s3_algorithm" {
  default = "AES256"
  type = string
  
}
variable "s3_video_analytics_sse_configuration_sse_s3_algorithm" {
  default = "AES256"
  type = string
  
}
variable "s3_codepipeline_artifact_sse_configuration_sse_s3_algorithm" {
  default = "AES256"
  type = string
  
}
variable "s3_review_app_data_sse_configuration_sse_s3_algorithm" {
  default = "AES256"
  type = string
  
}
variable "s3_video_analytics_account_replication_markers_status" {
  default     = "Enabled"
  type        = string
}
variable "s3_video_analytics_account_replication_destination_bucket_arn" {
  default     = "arn:aws:s3:::s3-dev-core-001-video-analytics"
  type        = string
}
variable "s3_video_analytics_account_replication_objects_storage_class" {
  default     = "STANDARD"
  type        = string
}
variable "s3_video_analytics_account_replication_delete_marker" {
  default     = "Enabled"
  type        = string  
}
variable "s3_video_analytics_account_replication_cross_account_id" {
  default     = 889900112233
  type        = number
}


variable "s3_account_replication_role"{
  default = "service-role-dev-core-001-s3-account-replication-role"
}

variable "s3_codepipeline_artifact_demo_bucket_name" {
  default = "s3-dev-core-001-demo-codepipeline-artifact"
}
variable "s3_codepipeline_artifact_demo_bucket_force_destroy" {
  default = false
}
variable "s3_codepipeline_artifact_demo_tags" {
  default = null
}
variable "s3_codepipeline_artifact_demo_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_codepipeline_artifact_demo_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_codepipeline_artifact_demo_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_codepipeline_artifact_demo_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_codepipeline_artifact_demo_restrict_public_buckets" {
  default  = true
  type     = bool
}
variable "s3_codepipeline_artifact_demo_policy" {
  default  = null
  type     = string
}
variable "s3_codepipeline_artifact_demo_sse_configuration_sse_s3_algorithm" {
  default = "AES256"
  type    = string
  
}



variable "s3_video_analytics_review_bucket_name" {
  default = "s3-dev-core-001-review-video-analytics"
}
variable "s3_video_analytics_review_bucket_force_destroy" {
  default = false
}
variable "s3_video_analytics_review_tags" {
  default = null
}
variable "s3_video_analytics_review_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_video_analytics_review_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_video_analytics_review_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_video_analytics_review_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_video_analytics_review_bucket_object_ownership"{
  default = "BucketOwnerEnforced"
  type    = string
}
variable "s3_video_analytics_review_restrict_public_buckets" {
  default  = true
  type     = bool
}
variable "s3_video_analytics_review_enabled"{
  default  = true
  type     = bool
}

 


variable "public_template_bucket_name" {
  default = "s3-dev-core-001-email-template-data"
}
variable "public_template_bucket_force_destroy" {
  default = false
}
variable "public_template_tags" {
  default = null
}
variable "public_template_object_lock_enabled" {
   default = false
   type    = bool
}
variable "public_template_acl" {
  default  = "public-read"
  type  = string
}
variable "public_template_enabled" {
  default  = true
  type  = bool
}



variable "s3_bucket_common_bucket_name" {
  default = "s3-dev-core-001-common-email-template"
}
variable "s3_bucket_common_bucket_force_destroy" {
  default = false
}
variable "s3_bucket_common_tags" {
  default = null
}
variable "s3_bucket_common_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_bucket_common_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_bucket_common_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_bucket_common_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_bucket_common_bucket_object_ownership"{
  default = "BucketOwnerEnforced"
  type    = string
}
variable "s3_bucket_common_restrict_public_buckets" {
  default  = true
  type     = bool
}
variable "s3_bucket_common_enabled"{
  default  = false
  type     = bool
}


variable "s3_core_common_cdn_data_bucket_name" {
  default = "s3-dev-core-001-common-cdn-data"
}
variable "s3_core_common_cdn_data_bucket_force_destroy" {
  default = false
}
variable "s3_core_common_cdn_data_tags" {
  default = null
}
variable "s3_core_common_cdn_data_object_lock_enabled" {
   default = false
   type    = bool
}
variable "s3_core_common_cdn_data_block_public_acls" {
  default  = true
  type  = bool
}
variable "s3_core_common_cdn_data_block_public_policy" {
  default  = true
  type     = bool
}
variable "s3_core_common_cdn_data_ignore_public_acls" {
  default  = true
  type     = bool
}
variable "s3_core_common_cdn_data_bucket_object_ownership"{
  default = "BucketOwnerEnforced"
  type    = string
}
variable "s3_core_common_cdn_data_restrict_public_buckets" {
  default  = true
  type     = bool
}
variable "s3_core_common_cdn_data_enabled"{
  default  = false
  type     = bool
}
