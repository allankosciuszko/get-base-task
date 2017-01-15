 #!/bin/bash
 ./start_gradle_wrapper.sh

 if [ -n "${SELENIUM_HOSTNAME}" ]; then
  ./gradlew firefoxTest
 else
    echo "No SELENIUM_HOSTNAME variable set!";
    exit 1;
fi;