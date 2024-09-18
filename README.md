# university-cedar-experience

This repository contains the code and resources for my Bachelor's thesis project, which focuses on implementing and evaluating access control policies using the Cedar authorization language.
The project explores various access control models, including Role-Based Access Control (RBAC) and Attribute-Based Access Control (ABAC), thus demonstrating how Cedar can be used to define fine-grained authorization rules.
Here is a mock of a university manager application using a few policy definitions and sample test cases, all aimed at showcasing Cedar's capabilities in managing permissions and access in complex systems.
This work highlights the practical applications of Cedar in real-world scenarios, providing a foundational understanding of policy-based access control mechanisms.

To run the validation of the policies, run the following code in the folder the files are in:
```
cedar validate -s cedarschema.json -p policies.cedar
```

To run the evaluation of a request, run the following code:
```
cedar authorize --request-json 0.cedarauth.json -p policies.cedar -s cedarschema.json --entities cedarentities.json
```
Change the number in 0.cedarauth.json based on the request you want to evaluate.
If you want it to be verbose, showing which policies applied to the request, you can append "-v" in the above line. 
