pipeline { 
    agent { 
        node { 
            label 'master' 
            
        } 
        
    } 
    environment { 
        PRODUCT_NAME='sdk_phone_x86_64' 
        
    } 
    stages{ 
        stage('git clone') { 
            steps { 
                cleanWs()
                sh 'git clone https://github.com/thiagohrm/aosp_scripts.git' 
                sh 'chmod u+x aosp_scripts/*'
            } 
        }
        stage('Repo Sync') { 
            steps { 
                script {
                   def output = sh(returnStdout: true, script : '${WORKSPACE}/aosp_scripts/repo_sync.sh').trim()
                   println("command output: ${output}")
                }
            }
        } 
        stage('user-clean') { 
            steps { 
                sh '${WORKSPACE}/aosp_scripts/clean.sh' 
                
            }
        }
        stage('user-system') { 
            steps { 
                sh '${WORKSPACE}/aosp_scripts/system-image.sh $ImageBuildNumber $PRODUCT_NAME user' 
                
            } 
            
        } 
        stage('user-incremental') { 
            steps { 
                sh '${WORKSPACE}/aosp_scripts/incremental-image.sh $PRODUCT_NAME user previous_image_path' 
                
            } 
            
        } 
        stage('user-full-ota') { 
            steps { 
                sh '${WORKSPACE}/aosp_scripts/OTA-image.sh $PRODUCT_NAME user'    } 
            
        } 
        stage('change-log') { 
            steps { sh '${WORKSPACE}/aosp_scripts/change-log.sh' } 
            
        } 
        stage('userdebug-clean') { 
            steps { 
                sh '${WORKSPACE}/aosp_scripts/clean.sh' } 
            
        } 
        stage('userdebug-system') { 
            steps { 
                sh '${WORKSPACE}/aosp_scripts/system-image.sh $ImageBuildNumber $PRODUCT_NAME userdebug' } 
            
        } 
        stage('userdebug-incremental') { 
            steps { sh '${WORKSPACE}/aosp_scripts/incremental-image.sh $PRODUCT_NAME userdebug previous_image_path' } 
            
        } 
        stage('userdebug-full-ota') { 
            steps { sh '${WORKSPACE}/aosp_scripts/OTA-image.sh $PRODUCT_NAME userdebug' } 
            
        } 
    }
    post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']]
                               )
        }
    }
}
