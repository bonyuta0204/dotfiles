function ecs-exec -a ECS_ENV
  # Validate the argument
  if not contains $ECS_ENV it stg stg01
    echo "Invalid or no environment specified."
    echo "Usage: ecs-exec [it|stg|stg01]"
    return 1
  end

  set CLUSTER_NAME kpiee-$ECS_ENV
  set SERVICE_NAME kpiee-$ECS_ENV-ecs-exec
  set CONTAINER_NAME kpiee-$ECS_ENV-rails
  set TASK_ARN (aws ecs list-tasks --cluster $CLUSTER_NAME --service-name $SERVICE_NAME  --output text  --query "taskArns[0]")

  aws ecs execute-command --cluster $CLUSTER_NAME --task $TASK_ARN --container $CONTAINER_NAME --command "/bin/bash" --interactive
end

