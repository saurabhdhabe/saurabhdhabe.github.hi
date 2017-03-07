import java.util.Scanner;

public class WordCount
{
	public static void main (String[] args)
	{
		Scanner sc=new Scanner(System.in);
		int i=0, wordCount=0, maxwords =0;
		String str="We test coders.Give us a try?";
        while(i<str.length())
        {
        	if(str.charAt(i) == ' ')
        	{
        		wordCount++;
        	}
        	else if(str.charAt(i)== '.' || str.charAt(i) == '?' || str.charAt(i)== '!')
        	{
        		wordCount++;
        		if(wordCount > maxwords)
        		{
        			maxwords= wordCount;
        		}
        		wordCount=0;
        	}
        	i++;
        }
        System.out.println(maxwords);
	}
}