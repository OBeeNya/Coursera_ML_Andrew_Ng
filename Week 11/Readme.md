# **WEEK 11**

## **Photo OCR**  

*Problem description and pipeline:*  
Optical Character Recognition case study.  
How to read text in images.  
1/ Text detection  
2/ Character segmentation  
3/ Character recognition  
4/ Spelling correction  
These steps are the *ML pipeline*, and a good choice of modules can be every important in the efficiency of the overall system.  

*Sliding windows:*  
Ratios, step-size/stride, expansion...

*Getting lots of data and artificial data:*  
Artificial data synthesis: creating data from scratch or amplifying training data.  
Make sure you have a low bias classifier before expanding the effort.  
How much work would it be to get 10x as much data as we currently have?  
Other way is collecting and labelling data yourself.  
Crowd sourcing: hire people to label data.

*Ceiling analysis: What part of the pipeline to work on next:*  
Give perfect data to each module and see how much performance increase we can get on each.  
