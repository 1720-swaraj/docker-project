pipeline {
    agent {
        label 'built-in'
    }
    environment{
        CONTAINER_NAME="httpd-${env.BRANCH_NAME}"
        PORT="${env.BRANCH_NAME == "2025-q1" ? '80' : env.BRANCH_NAME == "2025-q2" ? '90' : env.BRANCH_NAME == "2025-q3" ? '91' : '85' }"
    }
    stages{  
        stage('checkout'){
            steps{
                cleanWs()
                checkout scm
                sh 'ls -lrta'
                sh 'pwd'
            }
        }
        stage('build'){
            steps{
                script{
                    //copy index.html into another folder
                    sh 'mkdir -p website'
                    sh 'cp index.html website/'
                    // docker run
                    sh '''
                    docker run -itdp \$PORT:80 --name \$CONTAINER_NAME -v \$WORKSPACE/website://usr/local/apache2/htdocs/ httpd 
                    
                    '''
                }
            }
        }
    }
}

/*
Note:-
1) Inside ''' ''' tripal comma we need to give escape sequences like \$BRANCH_NAME.

2) Inside ' ' single and " " double inverted comma we dont need to give escape sequences we simply use $BRANCH_NAME.

3) Checkout scm is used to clone repo without using git clone 

4) $BRANCH_NAME is in-built environment veriable which will provide current branch name
*/
