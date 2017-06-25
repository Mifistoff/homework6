json.extract! task, :id, :title, :body, :user_id, :admin_id, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
