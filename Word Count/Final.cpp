#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>
#include <map>

using namespace std;

class Word                      //for storing word & its count.
{
    
    public : 
     int wcount;
     string wcounts;
};

class WordList                  //Sequence Of Container.
{
    public:
    vector<string> vec1;
    string words;
};

int main()
{
    ifstream file("file.txt");              //Scanning of text file.
    
    
    WordList obj;
    obj.vec1;
    obj.words;
    while(file >> obj.words)
    {
        obj.vec1.push_back(obj.words);
        
    }
    sort(obj.vec1.begin(), obj.vec1.end());
    
    int vsize = obj.vec1.size();
    if (vsize == 0)
    {
        cout << "No words" << endl;
        return 1;
    }
    int wordCount = 1;
    int serial_num = 0;
    obj.words = obj.vec1[0];
    for(int i=1; i<vsize; i++)
    {
        if(obj.words!=obj.vec1[i] && serial_num<=obj.vec1.size())
        {
            serial_num++;
            cout << serial_num << ". " << obj.words << " " << wordCount << endl;
            wordCount=1;
            cout << "\n";
            obj.words=obj.vec1[i];
        }
        else
        {
            wordCount++;
        }
    }
    
    cout << serial_num << ". " << obj.words << " " << wordCount << endl;
    cout << "\n";
    cout << serial_num+1;
    return 0;
    
    
}