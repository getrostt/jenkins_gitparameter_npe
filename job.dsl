pipelineJob('testMain2') {
    displayName('Test Main2')
    
    definition {
        cpsScm {
            lightweight(true)
            scriptPath('mainPipeline.jenkins')
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

pipelineJob('test2') {
    displayName('Test2')

    parameters {
        configure { project ->
            project / 'properties' / 'hudson.model.ParametersDefinitionProperty' / 'parameterDefinitions' << 'net.uaznia.lukanus.hudson.plugins.gitparameter.GitParameterDefinition' {
                name('TARGET_BRANCH')
                description('Branch to integrate')
                type('PT_BRANCH')
                branchFilter('origin/main$')
                sortMode('ASCENDING_SMART')
                defaultValue('main')
                selectedValue('DEFAULT')
            }
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