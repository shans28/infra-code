#role-dev-core-001-admin
variable "role_prj1_001_dev_admin_role_name" {
  default = "role-dev-core-001-admin"
}

variable "role_prj1_001_dev_admin_policy_name" {
  default = "role-dev-core-001-admin"
}

variable "role_prj1_001_dev_admin_policy_description" {
  default = "Provides full access to AWS services and resources."
}

#username
variable "role_prj1_001_dev_admin_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}


variable "role_dev_core_001_pwusr_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}

variable "role_dev_core_001_suppwusr_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}

variable "service_role_dev_core_001_kube_deployments_username" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = []
}

variable "role_prj1_001_dev_admin_role_tags" {
  default = null
  type    = map(string)
}

#role-dev-core-001-pwusr
variable "role_dev_core_001_pwusr_role_name" {
  default = "role-dev-core-001-pwusr"
}

variable "role_dev_core_001_pwusr_policy_name" {
  default = "role-dev-core-001-pwusr"
}

variable "role_dev_core_001_pwusr_policy_description" {
  default = "Provides full access to AWS services and resources."
}

variable "role_dev_core_001_pwusr_role_tags" {
  default = null
  type    = map(string)
}

#role-dev-core-001-suppwusr
variable "role_dev_core_001_suppwusr_role_name" {
  default = "role-dev-core-001-suppwusr"
}

variable "role_dev_core_001_suppwusr_policy_name" {
  default = "role-dev-core-001-suppwusr"
}

variable "role_dev_core_001_suppwusr_policy_description" {
  default = "Provides full access to AWS services and resources."
}

variable "role_dev_core_001_suppwusr_role_tags" {
  default = null
  type    = map(string)
}

#service-role-dev-core-001-kube-deployments
variable "service_role_dev_core_001_kube_deployments_role_name" {
  default = "service-role-dev-core-001-kube-deployments"
}

variable "service_role_dev_core_001_kube_deployments_policy_name" {
  default = "service-role-dev-core-001-kube-deployments"
}

variable "service_role_dev_core_001_kube_deployments_policy_description" {
  default = "Provides full access to AWS services and resources."
}

variable "service_role_dev_core_001_kube_deployments_role_tags" {
  default = null
  type    = map(string)
}

variable "role_prj1_001_dev_admin" {
  default = "ROLE-prj1-001-DEV-ADMIN"
}

variable "role_prj1_core_001_tf" {
  default = "ROLE-prj1-CORE-001-TF"
}

variable "cp_apps_role_name" {
  default = "service-role-dev-core-001-cp-apps-deploy"
}
variable "cp_apps_policy_name" {
  default = "service-role-dev-core-001-cp-apps-deploy"
}
variable "cp_lambda_role_name" {
  default = "service-role-dev-core-001-cp-lambda-deploy"
}
variable "cp_lambda_policy_name" {
  default = "service-role-dev-core-001-cp-lambda-deploy"
}
variable "lambda_role_name" {
  default = "service-role-dev-core-001-lambda-cp-alerts"
}
variable "lambda_policy_name" {
  default = "service-role-dev-core-001-lambda-cp-alerts"
}
variable "cb_apps_role_name" {
  default = "service-role-dev-core-001-cb-apps-deploy"
}
variable "cb_apps_policy_name" {
  default = "service-role-dev-core-001-cb-apps-deploy"
}
variable "kube_deploy" {
  default = "kubernetes_deployment"
}
variable "cb_lambda_role_name" {
  default = "service-role-dev-core-001-cb-lambda-deploy"
}
variable "cb_lambda_policy_name" {
  default = "service-role-dev-core-001-cb-lambda-deploy"
}
variable "cp_assume_role_policy" {
  default = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codepipeline.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}
variable "cb_assume_role_policy" {
  default = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codebuild.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}
variable "lambda_cp_assume_role_policy" {
  default = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}


variable "lambda_call_transcribe_for_all_speaker_at_one_audio_role_name" {
  default = "service-role-dev-core-001-lambda-call-transcribe-for-all-speaker"
}

variable "lambda_call_transcribe_for_all_speaker_at_one_audio_policy_name" {
  default = "service-role-dev-core-001-lambda-call-transcribe-for-all-speaker"
}
variable "lambda_review_call_transcribe_for_all_speaker_at_one_audio_role_name" {
  default = "service-role-dev-core-001-lambda-review-call-transcribe"
}

variable "lambda_review_call_transcribe_for_all_speaker_at_one_audio_policy_name" {
  default = "service-role-dev-core-001-lambda-review-call-transcribe"
}
variable "lambda_fetch_room_id_for_twilio_composed_video_role_name" {
  default = "service-role-dev-core-001-lambda-fetch-room-id-for-twilio-video"
}

variable "lambda_fetch_room_id_for_twilio_composed_video_policy_name" {
  default = "service-role-dev-core-001-lambda-fetch-room-id-for-twilio-video"
}
variable "lambda_review_fetch_room_id_for_twilio_composed_video_role_name" {
  default = "service-role-dev-core-001-lambda-review-fetch-twilio-video"
}

variable "lambda_review_fetch_room_id_for_twilio_composed_video_policy_name" {
  default = "service-role-dev-core-001-lambda-review-fetch-twilio-video"
}
variable "lambda_analytics_on_recroded_audio_transcribe_role_name" {
  default = "service-role-dev-core-001-lambda-analytics-on-recorded-audio"
}

variable "lambda_analytics_on_recroded_audio_transcribe_policy_name" {
  default = "service-role-dev-core-001-lambda-analytics-on-recorded-audio"
}

variable "lambda_parse_composed_json_to_table_role_name" {
  default = "service-role-dev-core-001-lambda-parse-composed-json-to-table"
}

variable "lambda_parse_composed_json_to_table_policy_name" {
  default = "service-role-dev-core-001-lambda-parse-composed-json-to-table"
}
variable "lambda_review_parse_composed_json_to_table_role_name" {
  default = "service-role-dev-core-001-lambda-review-parse-json-to-table"
}

variable "lambda_review_parse_composed_json_to_table_policy_name" {
  default = "service-role-dev-core-001-lambda-review-parse-json-to-table"
}
variable "lambda_twilio_audio_to_json_transcribe_role_name" {
  default = "service-role-dev-core-001-lambda-twilio-audio-to-json-transcribe"
}

variable "lambda_twilio_audio_to_json_transcribe_policy_name" {
  default = "service-role-dev-core-001-lambda-twilio-audio-to-json-transcribe"
}

variable "lambda_prj1_patient_remainder_role_name" {
  default = "service-role-dev-core-001-lambda-prj1-patient-remainder"
}

variable "lambda_prj1_patient_remainder_policy_name" {
  default = "service-role-dev-core-001-lambda-prj1-patient-remainder"
}
variable "lambda_review_prj1_patient_remainder_role_name" {
  default = "service-role-dev-core-001-lambda-review-prj1-patient-remainder"
}
variable "lambda_review_prj1_patient_remainder_policy_name" {
  default = "service-role-dev-core-001-lambda-review-prj1-patient-remainder"
}
variable "lambda_reminder_team_to_update_entries_role_name" {
  default = "service-role-dev-core-001-lambda-reminder-team-to-update-entries"
}

variable "lambda_reminder_team_to_update_entries_policy_name" {
  default = "service-role-dev-core-001-lambda-reminder-team-to-update-entries"
}

variable "lambda_SecretsManager_rds_mysql_rot_role_name" {
  default = "service-role-dev-core-001-lambda-SecretsManagerRDSMySQLRot"
}

variable "lambda_SecretsManager_rds_mysql_rot_policy_name" {
  default = "service-role-dev-core-001-lambda-SecretsManagerRDSMySQLRot"
}

variable "lambda_SecretsManager_rds_mysql_rot_role_tags" {
  default = {
    "SecretsManagerLambda" = "Rotation"
    "lambda:createdBy"     = "SAM"
  }
  type    = map(string)
}

variable "lambda_rds_lambda_role_name" {
  default = "service-role-dev-core-001-lambda-rdsLambda"
}

variable "lambda_rds_lambda_policy_name" {
  default = "service-role-dev-core-001-lambda-rdsLambda"
}

variable "lambda_transcription_analytics_file_path_role_name" {
  default = "service-role-dev-core-001-lambda-transcription-analytics-file"
}

variable "lambda_transcription_analytics_file_path_policy_name" {
  default = "service-role-dev-core-001-lambda-transcription-analytics-file"
}
variable "lambda_review_transcription_analytics_file_path_role_name" {
  default = "service-role-dev-core-001-lambda-review-analytics-file"
}

variable "lambda_review_transcription_analytics_file_path_policy_name" {
  default = "service-role-dev-core-001-lambda-review-analytics-file"
}

variable "policy_allow_only_write_video_analytics" {
  default = "policy-allow-only-write-video-analytics"
}

variable "policy_allow_only_write_video_analytics_path" {
  default = null
}

variable "policy_allow_only_write_video_analytics_description" {
  default = null
}

variable "s3_video_analytics_bucket_path_policy_allow_only_write_video_analytics" {
  default = "dump_from_twilio"
}
variable "s3_video_analytics_account_replication_role_name" {
  default = "service-role-dev-core-001-s3-account-replication-role"
}
variable "s3_video_analytics_account_replication_role_policy" {
  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
variable "s3_video_analytics_account_replication_policy_name" {
  default = "service-role-dev-core-001-s3-account-replication-policy"
  
}
variable "s3_video_analytics_account_replication_destination_bucket_name" {
  default     = "s3-demo-core-001-video-analytics"
  type        = string
}

variable "lambda_prj1_patient_remainder_every_hour_role_name" {
  default = "service-role-dev-core-001-lambda-prj1-patient-remainder-evryhr"
}

variable "lambda_prj1_patient_remainder_every_hour_policy_name" {
  default = "policy-dev-core-001-lambda-prj1-patient-remainder-evryhr"
}

variable "lambda_sentiment_analysis_role_name" {
  default = "service-role-dev-core-001-lambda-sentiment-analysis"
}

variable "lambda_sentiment_analysis_policy_name" {
  default = "policy-dev-core-001-lambda-sentiment-analysis"
}

variable "lambda_prj1_patient_remainder_every_hour_review_role_name" {
  default = "service-role-review-core-001-lambda-prj1-patient-remndr-evryhr"
}

variable "lambda_prj1_patient_remainder_every_hour_review_policy_name" {
  default = "policy-review-core-001-lambda-prj1-patient-remndr-evryhr"
}

variable "lambda_prj1_patient_remainder_every_hour_demo_role_name" {
  default = "service-role-demo-core-001-lambda-prj1-patient-remndr-evryhr"
}

variable "lambda_prj1_patient_remainder_every_hour_demo_policy_name" {
  default = "policy-demo-core-001-lambda-prj1-patient-remndr-evryhr"
}
variable "demo_other_secrets"{
  default = "secrets-dev-core-001-demo-other-secrets-e3uNcj"
}


variable "lambda_services_deletion_alerts_role_name"{
  default = "service-role-dev-core-001-lambda-services-deletion-alerts"
}
variable "lambda_services_deletion_alerts_policy_name"{
  default = "policy-role-dev-core-001-lambda-services-deletion-alerts"
}
