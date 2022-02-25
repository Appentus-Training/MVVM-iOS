# MVVM-iOS
Standard MVVM pattern.

This Project demonstrates a demo of MVVM Architecture implemetation following the clean code practices.
to show an api demo i'm using Dummy apis 

https://dummy.restapiexample.com

i have implemented the GET and POST methods, further you can explore more functions in utility class.

The MVVM Structure is as follows

![image](https://user-images.githubusercontent.com/37444497/155666727-d13bafda-ea8f-41d5-8884-4eac4425f507.png)

Model :- Creates Request and response in Codables
Validation :- It validates a Model / Request and returns validation result
Resource :- Interacts with HTTPUtility(Webservices) and returns the response
View :- Manage User Interaction, send actions to viewmodel and recives result from viewmodel
ViewModel :- Listen to viewcontroller actions, performs requests and returns result to view. It interacts with resource and return result from resource.

HTTPUtility :- Used to call various webservices(Get,Post,Put,Delete) using URL session.
