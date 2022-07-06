void call(){
    stage("Maven: Print Build"){
        println "build from the maven library"
    }
    stage("Maven: Build"){
        docker.image("maven").inside{
            sh("mvn version")
        }
    }
}
