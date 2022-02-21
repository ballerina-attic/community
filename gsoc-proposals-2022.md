# Google Summer of Code 2022

## About Us

Our goal is to make [Ballerina](https://ballerina.io/) a modern programming language that combines the best of programming languages, integration technology, and cloud native computing into a textual and graphical language optimized for integration, and with mainstream potential.

Ballerina is a 100% open-source project created and sponsored by [WSO2](https://wso2.com/), with all parts of the project developed openly at [https://github.com/ballerina-platform](https://github.com/ballerina-platform). Already downloaded by nearly 10,000 developers worldwide, Ballerina is the only modern cloud native programming language that provides features for easily using, combining and creating network services for the cloud.

Uniquely, Ballerina provides a bidirectional mapping of sequence diagrams and code,
meaning the diagram is the code, and the code is the diagram. As a result, developers can easily switch between working in a pro-code or low-code view of a program as needed to maximize their productivity. At the same time, Ballerina removes much of the complexity in developing enterprise-grade cloud native applications, APIs and microservices by providing a first-class way to represent network interactions while streamlining many functions around data usage, configurations, cloud deployments, and more.

The recent Swan Lake GA release adds a new set of substantial language features and platform tools to produce programs that handle network interactions, data, and concurrency straightforwardly, and are easy to maintain.

The Ballerina project began in 2016. With over 80 active developers and 1,000 Slack users, the Ballerina ecosystem continues to grow. 

## Prerequisites

Coding skills, basic familiarity with Git, and solid understanding and interest in programming. The ability to quickly understand existing code is beneficial.

## Contributor Guidance for Proposals

1. Please provide a CV.
2. In your application, please include answers to the following questions:
  - What interests you most about our project?
  - What experience do you have with similar projects or project requirements? 
  - As mentors and project coordinators, how can we get the best out of you?
  - Is there anything that you’ll be studying or working on whilst working alongside us?
  - Are there any techniques and tools which you use to keep yourself organized?
3. Once you’ve selected a project assignment from the ideas page, please include a well-defined, weekly schedule with clear milestones and deliverables around it.
4. Alternatively, if you want to propose your own idea then please include outline, goals, and a well-defined weekly schedule with clear milestones and deliverables.
5. All applications must go through Google's application system; we can't accept any application unless it is submitted there.
6. Make it easy for your mentors to give you feedback. If you're using Google docs, enable comments and submit a "draft" (we can't see the "final" versions until applications close).
7. You can get in touch with your prospective mentors via their email (as provided in the ideas list) about what they expect of GSoC applicants and get help from them to refine your project ideas.
8. Submit your application to [Google](https://summerofcode.withgoogle.com/) before the deadline.

## Ideas for Discussion

### Idea 1: Implement a dependency graph visualizer plugin for Ballerina

The Ballerina programming language has a variety of tools associated with VS Code plugins. One such tool is the Compiler Toolkit plugin. In this project, we are going to extend the current plugin to visualize the dependency graph associated with a given Ballerina Program. The dependency 

**Expected Outcome**
1. Extend the existing VS Code plugin with the Dependency Graph view
2. Implement an extension to the ballerina language server to access the dependency graph data
3. Write a Blog post on the project and the usage of the plugin

**Sample Set of Features of the Plugin**

1. Visualize the dependency graph
2. Once clicked over a particular dependency, show information about the dependency, such as version, organization name, and etc.
3. Nodes of the graph should be collapsible
4. Show usages of a certain dependency in the current project

**Relevant Skills**

1. Familiarity with **React.js** and **Typescript**. If not, we can learn during the project.
2. Familiarity with **Java**
3. VS Code plugin development
4. Language Server Protocol


**Possible Mentors**
[Nadeeshaan Gunasinghe](mailto:nadeeshaan@wso2.com)

**Expected Size of the Project**  (175 or 350 hour)

**Complexity** medium/high

**Additional resources/references**
1. [https://github.com/ballerina-platform/plugin-vscode-compiler-toolkit](https://github.com/ballerina-platform/plugin-vscode-compiler-toolkit) 
2. [https://marketplace.visualstudio.com/items?itemName=sz-p.dependencygraph](https://marketplace.visualstudio.com/items?itemName=sz-p.dependencygraph)
3. [https://github.com/ballerina-platform/ballerina-lang](https://github.com/ballerina-platform/ballerina-lang)
4. [https://microsoft.github.io/language-server-protocol/specifications/specification-current/](https://microsoft.github.io/language-server-protocol/specifications/specification-current/) 
