#include "twcommon.h"
using namespace std;

//SHRP minUtils
class minUtils{
    public:
        static bool compare(string str1,string str2);
        static bool isFileEditable(string fileExtension);
        static bool find(std::string str,std::string sub);
		static bool find(std::string str,std::string sub,int dummy);
};


//Text Editor Class
class textEditor{
	private:
		void pushString(string,string);									//push the processed strings into the file
	public:
		void disp_file(string);													//displays the content of the file in the console
		void replaceLine(string,string,int);						//replaces specific line into the file
		void addLine(string,string,int);								//adds specific line into the file
		void removeLine(string,int);										//removes specific line from the file
		void getdString(string,string&,string&,int,int);//divides the file in two strings according to the parameter
		void getReplacebleLine(string,int);							//finds the line which are going to be replace
		string handleTab(string str);										//handles Tab character
		int getLineNo(string path);											//process total line of text file
};

//Parse Theme
class ThemeParser{
	private:
		string themeName;
		string bgColor;
		string navBgColor;
		string accColor;
		string textColor;
		void processValue(string,int);
		bool verifyColor(string);
	public:
		void fetchInformation(string);
		bool verifyInformation();
		void pushValues();
};