pipelineJob('test') {
    displayName('Test')

    parameters {
        gitParameter {
            name('TARGET_BRANCH')
                description('Branch to integrate')
                type('PT_BRANCH')
                branch('')
                branchFilter('origin/main$')
                sortMode('ASCENDING_SMART')
                defaultValue('main')
                selectedValue('DEFAULT')
                tagFilter('')
                useRepository('')
                quickFilterEnabled(true)

        }
    }
    
    definition {
        cpsScm {
            lightweight(true)
            scriptPath('Jenkinsfile')
            scm {
                git {
                    branch 'origin/main'
                    remote {
                        url 'https://github.com/getrostt/jenkins_gitparameter_npe.git'
                    }
                }
            }
        }
    }
}