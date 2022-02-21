# Google Summer of Code 2022

## About Us

Our goal is to make [Ballerina](https://ballerina.io/) a modern programming language that combines the best of programming languages, integration technology, and cloud native computing into a textual and graphical language optimized for integration, and with mainstream potential.

Ballerina is a 100% open-source project created and sponsored by [WSO2](https://wso2.com/) with all parts of the project developed openly at [https://github.com/ballerina-platform](https://github.com/ballerina-platform). Already downloaded by nearly 10,000 developers worldwide, Ballerina is the only modern cloud-native programming language that provides features for easily using, combining, and creating network services for the cloud.

Uniquely, Ballerina provides a bidirectional mapping of sequence diagrams and code, meaning the diagram is the code, and the code is the diagram. As a result, developers can easily switch between working in a pro-code or low-code view of a program as needed to maximize their productivity. At the same time, Ballerina removes much of the complexity in developing enterprise-grade, cloud-native applications, APIs and microservices by providing a first-class way to represent network interactions while streamlining many functions around data usage, configurations, cloud deployments, and more.

The recent Ballerina 2201.0.0 (Swan Lake) release adds a new set of substantial language features and platform tools to produce programs that handle network interactions, data, and concurrency straightforwardly, and are easy to maintain.

The Ballerina project began in 2016. With over 80 active developers and 1,000 Slack users, the Ballerina ecosystem continues to grow. 

## Prerequisites

- A solid understanding and interest in programming is a must
- Familiarity with Git and GitHub
- The ability to quickly understand existing code is beneficial

## Contributor Guidance for Proposals

1. Please provide a CV.
2. In your application, please include answers to the following questions:
  - What interests you most about our project?
  - What experience do you have with similar projects or project requirements? 
  - As mentors and project coordinators, how can we get the best out of you?
  - Is there anything that you will be studying or working on whilst working alongside us?
  - Are there any techniques and tools, which you use to keep yourself organized?
3. Once you have selected a project assignment from the ideas page, please include a well-defined, weekly schedule with clear milestones and deliverables around it.
4. Alternatively, if you want to propose your own idea, then, please include an outline, goals, and a well-defined weekly schedule with clear milestones and deliverables.
5. All applications must go through the Google's application system; we can't accept any application unless it is submitted there.
6. Make it easy for your mentors to give you feedback. If you're using Google docs, enable comments and submit a "draft" (we can't see the "final" versions until applications close).
7. You can get in touch with your prospective mentors via their email (as provided in the ideas list) about what they expect of the GSoC applicants and get help from them to refine your project ideas.
8. Submit your application to [Google](https://summerofcode.withgoogle.com/) before the deadline.

## Ideas for Discussion

### Idea 1: Implement a Dependency Graph Visualizer Plugin for Ballerina

The Ballerina programming language has a variety of tools associated with VS Code plugins. One such tool is the Compiler Toolkit plugin. In this project, we are going to extend the current plugin to visualize the dependency graph associated with a given Ballerina Program. 

**Expected Outcomes**

1. Extend the existing VS Code plugin with the Dependency Graph view
2. Implement an extension to the Ballerina language server to access the dependency graph data
3. Write a blog post on the project and the usage of the plugin

**Sample Set of Features of the Plugin**

1. Visualize the dependency graph
2. Once clicked over a particular dependency, show information about the dependency such as version, organization name, etc.
3. Nodes of the graph should be collapsible
4. Show usages of a certain dependency in the current project

**Relevant Skills**

1. Familiarity with **React.js** and **Typescript**. (If not, we can learn during the project).
2. Familiarity with **Java**
3. VS Code plugin development
4. Understanding of the Language Server Protocol

**Possible Mentors** 
[Nadeeshaan Gunasinghe](mailto:nadeeshaan@wso2.com)

**Expected Size of the Project**  
(175 or 350 hours)

**Complexity** 
medium/high

**Additional resources/references**

1. [https://github.com/ballerina-platform/plugin-vscode-compiler-toolkit](https://github.com/ballerina-platform/plugin-vscode-compiler-toolkit) 
2. [https://marketplace.visualstudio.com/items?itemName=sz-p.dependencygraph](https://marketplace.visualstudio.com/items?itemName=sz-p.dependencygraph)
3. [https://github.com/ballerina-platform/ballerina-lang](https://github.com/ballerina-platform/ballerina-lang)
4. [https://microsoft.github.io/language-server-protocol/specifications/specification-current/](https://microsoft.github.io/language-server-protocol/specifications/specification-current/) 

### Idea 2: Real-Time Web-Based Chat with Web Sockets and Notifications

The objective of this project is to demonstrate the cloud-native capabilities of the Ballerina programming language. Once implemented, this project will serve as a good example for the community to follow and implement end-to-end event-driven programming use cases with Ballerina. This will be a continuing effort and only the initial steps will be taken during GSoC.

The Ballerina standard library has rich support for writing real-time applications and event-driven programming. This project requires making use of Ballerina’s capabilities to implement a real-time interactive chat application. The application contains the following components:

1. Frontend - Written as a SPA (single page application) for users to sign in and chat with other users
2. Message Service - REST API to manage chat information
3. Message Service (Web Socket) - Written as a WebSocket service to send and receive new chat messages in real-time 
4. Notification service - Emails the recipient if the recipient isn’t online
5. Storage service - Handles media added to chats

The initial implementation will support only direct chats. Message service will send an event to a Kafka topic if the recipient is not online. The notification service will consume the event and will send an email to the recipient notifying about the new message.

**Expected Outcomes**

1. All components mentioned above are to be implemented in the Ballerina programming language
2. Notification service should guarantee exactly-once delivery
3. Deployment descriptors to deploy the application into a Kubernetes cluster
4. Documentation explaining the architecture and the implementation details
5. A blog post containing the overall implementation steps 

**Relevant Skills**

1. JavaScript and a modern frontend framework (React.js, Angular, Vue)
2. Knowledge of WebSockets (optional)
3. Knowledge of REST APIs
4. Understanding of event streaming (producer/consumer) systems like Kafka is a plus

**Possible Mentors** 
[Imesha Sudasingha](mailto:imesha@wso2.com)

**Expected Size of the Project** 
175 hours

**Complexity** 
medium

### Idea 3: Write a Single-Page Application(SPA) with Backend Services in Ballerina

The objective of this project is to demonstrate the cloud-native capabilities of the Ballerina programming language. Once implemented, this project will serve as a good example for the community to follow and implement end-to-end, full-stack use cases with Ballerina. This will be a continuing effort and only the initial steps will be taken during GSoC.

The Ballerina language comes with powerful capabilities to create backend APIs and services among others. This project requires creating an application that makes use of Ballerina’s capabilities to create REST and GraphQL APIs, gRPC services, asynchronous API, database access, service integration, and security along with creating a front-end application to consume the backend services. Ballerina has built-in support for AWS Lambda and Azure Functions too, so that you will have to build a serverless backend with AWS Lambda and Azure Functions. This entire application should be deployed on Kubernetes on GKE. 

**Expected Outcomes**

1. Come up with a good use case for an SPA with the help of the mentor
2. The application should consist of a front-end, several APIs, and microservices in the backend
3. The backend must consist of several REST APIs, gRPC services, GraphQL APIs (with database access), and integration among them depending on the use case
4. The backend will also include AWS Lambda and Azure Functions
5. The backend must also consist of asynchronous communication among some services with the aid of a broker such as Kafka
6. Write unit and integration tests
7. Add authentication to the backend services and the front end
8. Deploy the application on Kubernetes on GKE
9. Produce a comprehensive article based on the application to explain how Ballerina was used

**Relevant Skills**

1. JavaScript and any of its frameworks (React, Angular, Vue)
2. Knowledge of REST APIs
3. Ability to learn and implement gRPC and GraphQL APIs 
4. Understanding of the HTTP protocol
5. AWS and Azure experience
6. Knowledge of AWS Lambda Functions and Azure Functions

**Possible Mentors** 
[Imesha Sudasingha](mailto:imesha@wso2.com)

**Expected Size of the Project**  
175 hours 

**Complexity** 
medium 

### Idea 4: Recovery for Ballerina Distributed Transactions

In the Ballerina SwanLake release, distributed transactions do not have any recovery mechanism. In other words, If there is a failure in the middle of a transaction that involves multiple resource managers across multiple services, the Ballerina program cannot completely fail the whole transaction or continue from where it failed last time when the program restarts. In order to implement a recovery mechanism, there should be a way to save the current state of the transaction into persistent storage. 

The goal of this project is to come up with a solution to save the transactional state into persistent storage (e.g., file system or/and DB), and do a POC on how to recover from a failure. We need to think about different deployments and how to use the recovery accordingly. 
 
**Expected Outcomes**

1. A Proof of Concept (POC), which demonstrates recovery from a failure
2. Replace the current recovery mechanism (not fully functional) with a POC
3. Handle different deployment patterns and recover accordingly 

**Relevant Skills**

1. Experience with JTA, Java, two-phase commit, and logging
2. Having experience with Atomikos and Narayana would be an advantage

**Possible Mentors**
- [Gimantha Bandara](mailto:gimantha@wso2.com)
- [Chiran Fernando](mailto:chiran@wso2.com)

**Expected Size of the Project**  
350 hours

**Complexity** 
high 

### Idea 5: Develop a Templating Engine in Ballerina to Render HTML

Ballerina is currently capable of handling XML and JSON data. This project would create a Ballerina package that would be capable of invoking user data into an HTML template file and parsing it accordingly and generating a dynamic view file.

**Expected Outcomes**

1. Generate dynamic HTML files
2. The HTML view files should be able to extend from a parent template
3. Capability to include child views within an HTML view file
4. Handle displays (print), conditions (if/else), and loops (foreach) within the view file with the provided user data

**Relevant Skills**

1. Programming knowledge in Ballerina and preferably Java
2. Experience in HTML, CSS, and Javascript
3. Having worked with a templating engine such as the following:
  - RazorEngine - C#, ASP.NET
  - Thymeleaf - Java
  - Blade template engine - PHP
  - Jade language - Node.js 
8. Basic knowledge of the MVC architecture

**Possible Mentors**

- [Danesh Kuruppu](mailto:danesh@wso2.com)
- [Anjana Sivanandan](mailto:anjanasi@wso2.com)

**Expected Size of the Project**  
175 hours

**Complexity** 
medium

### Idea 6: Support gRPC Reflection in Ballerina gRPC Services

gRPC Reflection embeds metadata in service and exposes a new gRPC service called reflection that allows a calling client to query the list of available services and details about specific services. A gRPC service that supports reflection can be invoked via the `gRPCurl` tool. In the current version of Ballerina, the gRPC services are neither compatible with `gRPCurl` (it is unable to explicitly invoke the functions when using the Protobuf file as a reference) nor can they automatically be discovered via gRPCurl without Protobuf references. This project is to add reflection support to Ballerina services.

**Expected Outcomes**

1. Create a design proposal on how to support gRPC Reflection in Ballerina services
2. Implement the feature and test with the `gRPCurl` tool
3. Write unit and integration tests
4. Write an article describing the feature

**Relevant Skills**

1. Experience with gRPC and Protocol Buffers
2. Programming knowledge in Java

**Possible Mentors**
- [Danesh Kuruppu](mailto:danesh@wso2.com)
- [Buddhi Kothalawala](mailto:buddhik@wso2.com)

**Expected Size of the Project**  
175 hours

**Complexity** 
medium

**References**

- [https://github.com/grpc/grpc/blob/master/doc/server-reflection.md](https://github.com/grpc/grpc/blob/master/doc/server-reflection.md)
- [https://github.com/fullstorydev/grpcurl](https://github.com/fullstorydev/grpcurl)


### Idea 7: Micro Benchmark for the Ballerina Test Framework

The Ballerina test framework contains a set of useful features built for building microservices. Having a built-in, micro-benchmark feature in the test framework would allow users to quickly identify the performance of each function by executing tests. This approach is supported by default in Go. JMH supports this for java. The benchmark can be done using several modes, `Throughput`, `AverageTime`, `SampleTime`, `SingleShotTime`. 

**Expected Outcomes:**

1. Create a proposal on how to implement micro-benchmarks into the Ballerina test framework
2. Implement the benchmark into the test framework
3. Add a CLI flag for the `bal test` command
4. Create an article about the implementation

**Relevant Skills**

1. Familiarity with Java and Ballerina 
2. Knowledge on the existing microbenchmark tools and implementations(Go test, JMH)
3. Knowledge on writing ballerina compiler extensions
4. Familiarity with the implementation of the Ballerina test framework and the `observe` packages

**Possible Mentors**
- [Fathima Dilhasha](mailto:dilhasha@wso2.com)
- [Anjana Supun](mailto:anjanas@wso2.com)

**Expected size of the Project** 
350 hours

**Complexity** 
medium/high

**References**
- [https://github.com/openjdk/jmh](https://github.com/openjdk/jmh)
- [https://dzone.com/articles/java-microbenchmark-harness-jmh](https://dzone.com/articles/java-microbenchmark-harness-jmh)
- [https://github.com/ballerina-platform/ballerina-lang/tree/master/misc/testerina)
- [https://github.com/ballerina-platform/module-ballerina-observe](https://github.com/ballerina-platform/module-ballerina-observe)
- [https://github.com/ballerina-platform/module-ballerinai-observe](https://github.com/ballerina-platform/module-ballerinai-observe)
        
