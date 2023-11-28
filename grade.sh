CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


files=`find . -name "*.java" `
for file in $files
do 
    if [[ -f $file ]] && [[ $file == **/ListExamples.java* ]]
    then 
        echo 'File found' 
        cp $file grading-area/
        cp -r lib grading-area/
    fi 
done    
cd grading-area
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test.txt

grep "test" test.txt
grep -Eo '[0-9]{1,4}' test.txt


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
