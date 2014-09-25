/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.datamining;

/**
 *
 * @author daVz
 */
import com.servlets.*;
import weka.core.*;
import weka.core.converters.ConverterUtils.*;
import weka.classifiers.*;
import weka.classifiers.trees.*;

import java.io.*;

public class behavior {
public String prediction(int pn,int pl,int ce,int pi,int lp,int me){
    String returnedvalue=null;int pen=pn,pencil=pl,pepsi=pi,laptop=lp,mobile=me;
    try{
       BufferedReader reader = new BufferedReader(new FileReader("D:/rms.arff"));
 Instances train = new Instances(reader);
    train.setClassIndex(train.numAttributes() - 1);

    // 2. unlabeled data
 BufferedReader reader1 = new BufferedReader(new FileReader("D:/test.arff"));
 Instances unlabeled = new Instances(reader1);

 Instances test = new Instances(unlabeled);
// Create nominal attribute "position"

Instance inst = new Instance(7);

inst.setValue(0,pn);
inst.setValue(1,pl);
inst.setValue(2,ce);
inst.setValue(3,pi);
inst.setValue(4,lp);
inst.setValue(5,me);
//inst.setValue(6,"?");
// Set instance's dataset to be the dataset "test"
inst.setDataset(test);
test.add(inst);
System.out.println("Inside try catch");

 test.setClassIndex(train.numAttributes() - 1);

   // make sure that data is compatible
    if (!train.equalHeaders(test))
      throw new IllegalStateException("Training data and unlabeled data are incompatible!");
    // make sure that class values are missing
    for (int i = 0; i < test.numInstances(); i++)
    {
        test.instance(i).setClassValue(Instance.missingValue());
    }
    // build classifier
    J48 classifier = new J48();

    classifier.buildClassifier(train);
  returnedvalue=  generatePredictions(classifier, test);
System.out.println("And the final o/p is : "+returnedvalue);
}catch(Exception e){e.printStackTrace();
      System.out.println("Here : "+e.getMessage());}
return returnedvalue;
    }

  protected static String generatePredictions(J48 j48, Instances unlabeled)  {
String[] anArray;
anArray = new String[10];
int j=0;String answer=null;
      try {
      unlabeled.setClassIndex(unlabeled.numAttributes()-1);
      Instances labeled = new Instances(unlabeled);
      for (int i = 0; i < unlabeled.numInstances(); i++) {
        System.out.println("Instance(" + Integer.toString(i) + ") value:" + unlabeled.instance(i).stringValue(6));    //this works for all instances
        double clsLabel = j48.classifyInstance(unlabeled.instance(i));                    //this only works up to instance 28 and then fails thereafter
        labeled.instance(i).setClassValue(clsLabel);
          System.out.println("Answer is :"+labeled.instance(i).stringValue(6));
           answer=(labeled.instance(i).stringValue(6));
          System.out.println("each time value f answer is :"+answer);

      }

System.out.println("Answer is :"+labeled.toString());
      // write output
    }
    catch(Exception e) {
      e.printStackTrace();
      System.out.println(e.getMessage());
    }
return answer;
  }

}