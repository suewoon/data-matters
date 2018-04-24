# data-matters
Need a lightweight web-based BI tool? You got it.  

This is production-ready dashboard web application powered by Dash(Flask). You can easily 
launch a website for your own team with features like selective views by user type. 


## 1. Install
1. Clone the repo & Configure database connection  

First off, clone the repository.
```bash
git clone git@github.com:suewoon/data-matters.git
```
Next, you'll need a new database for storing members and data sources 


## 2. Usage 
1. Try it on your locals. 
```bash
mkvirtualenv [your-virtual-env]
source ~/.virtualenvs/[your-virtual-env]/bin/activate 
pip install requirements.txt 
```

2. Deployment with AWS CodeDeploy 
This repo already contains `appsepc.yml` for deployment using AWS CodeDeploy. 
2-1. 

