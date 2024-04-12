resource "aws_codedeploy_deployment_group" "codedeploy_deployment" {
  app_name              = local.codedeploy_app_name
  deployment_group_name = local.codedeploy_deployment_name

  service_role_arn   = aws_iam_role.codedeploy_iam_role.arn
  autoscaling_groups = [aws_autoscaling_group.asg.name]

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  blue_green_deployment_config {
    terminate_blue_instances_on_deployment_success {
      action = "TERMINATE"
    }

    deployment_ready_option {
      action_on_timeout    = "CONTINUE_DEPLOYMENT"
      wait_time_in_minutes = 0
    }
  }

  load_balancer_info {
    target_group_info {
      name = aws_lb_target_group.alb_tg.name
    }
  }

}