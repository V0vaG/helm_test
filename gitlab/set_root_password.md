# get container name
kubectl get pods -n argocd -l app=gitlab

# enter container
kubectl exec -n argocd -it <gitlab-pod-name> -- bash

# GitLab Rails console:
gitlab-rails console

# set new root password
user = User.find_by_username('root')
user.password = 'your_new_password'
user.password_confirmation = 'your_new_password'
user.save!
exit
