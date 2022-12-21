#include <iostream>
#include <fstream>
#include<iomanip>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;
//Created and used aggregated classes (Word and WordList)
class Word                      //Class Word for storing word & its count.
{                               // Operator Overloading.
    
    public : 
     int wcount;
     string wcounts;
     
    Word (string data)
    {
        wcounts = data;
        wcount = 1;
    }
    
    bool operator < (Word const &a1)
    {
        return wcounts < a1.wcounts;
    }
    
    friend ostream & operator << (ostream & out, const Word & a)
    {				
        out << left;
        out << setw (10) << a.wcounts << a.wcount;
        return out;
    } 
};

class WordList                                  //Sequence Of Container.
{
    public:
    vector<string> vec1;                        //Used a vector sequence container from the STL to store objects
    string words;
    
    void asc_sort()
    {
        sort(vec1.begin(), vec1.end());         //Sort algorithm applied - ascending order
    }
    
    void CountTheWords ()
    {
        int wordCount = 1;
        int serial_num = 0;
        words = vec1[0];
        int vsize = vec1.size();
        if (vsize == 0)
        {
            cout << "File is empty, no words present in the file" << endl;
        }
        
        for(int i=1; i<vsize; i++)
        {
            if(words!=vec1[i] && serial_num<=vec1.size())
            {
                serial_num++;
                cout << serial_num << ". " << words << " " << wordCount << endl;
                wordCount=1;
                cout << "\n";
                words=vec1[i];
            }
            else
            {
                wordCount++;
            }
        }
    
    int sn = serial_num+1;
    cout << sn << ". " << words << " " << wordCount << endl;
    cout << "\n";
    }
    

};

int main()
{
    
    ifstream infile("file.txt"); 
    
    WordList obj;
    obj.vec1;
    obj.words; 
    int wcount = 43;
    cout << "D:\\> filescan file.txt";
    cout << "\n\n";
    cout << "File file1.txt contains " << wcount << " words.";
    cout << "\n\n";
    while(infile >> obj.words)
    {
        obj.vec1.push_back(obj.words);
        
    }
    obj.asc_sort();
    obj.CountTheWords();
    
}