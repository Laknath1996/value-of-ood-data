# train (naive)
python3 train.py -m seed=10 random_reps=True reps=10 deploy=True device=cuda:2 is_multihead=False tag=5-domainbed/pacs-naive-ood-known task.dataset=pacs net=wrn16_4 loss.use_opt_alpha=True loss.group_task_loss=True loss.tune_alpha_tag=17_tune/pacs2 loss.m_n_list=[0,1,2,3,4,5,10] task.custom_sampler=True task.beta=0.75 task.target_env=P task.ood_env=S task.task_map=[[0,1,4]] task.target=0 task.ood=[0] task.n=10 task.m_n=0,1,2,3,4,5,10 task.augment=False hp.bs=16 hp.epochs=100 hydra.launcher.n_jobs=10

# tune
python3 tune_alpha.py -m seed=10 deploy=True device=cuda:2 is_multihead=False tag=5-domainbed/pacs-tune task.dataset=pacs net=wrn16_4 loss.tune_alpha=True loss.group_task_loss=True loss.alpha=0.5 loss.m_n_list=[1,2,3,4,5,10] task.custom_sampler=True task.beta=0.75 task.target_env=P task.ood_env=S task.task_map=[[0,1,4]] task.target=0 task.ood=[0] task.n=10 task.m_n=0 task.augment=False hp.bs=16 hp.epochs=100 hydra.launcher.n_jobs=10

# train (optimal)
python3 train.py -m seed=10 random_reps=True reps=10 deploy=True device=cuda:2 is_multihead=False tag=5-domainbed/pacs-optimal-ood-known task.dataset=pacs net=wrn16_4 loss.use_opt_alpha=True loss.group_task_loss=True loss.tune_alpha_tag=17_tune/pacs2 loss.m_n_list=[0,1,2,3,4,5,10] task.custom_sampler=True task.beta=0.75 task.target_env=P task.ood_env=S task.task_map=[[0,1,4]] task.target=0 task.ood=[0] task.n=10 task.m_n=0,1,2,3,4,5,10 task.augment=False hp.bs=16 hp.epochs=100 hydra.launcher.n_jobs=10