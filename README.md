# TH2 'Bill of Materials' (BOM) project (4.13.1)

This project contains the list of dependencies with their respective versions that are compatible and can be used with each other.

**NOTE: the BOM can be used only for Java based projects. All, dependencies specified in it are Java libraries**

It provides users which interact with the th2 (whether he or she writes a script or a new th2 box) with ability to
specify dependencies that are required for development in the th2 environment without defining a version for those dependencies.
The version will be taken from **the BOM** and it guarantees that different th2 dependencies _will be compatible with each other_.
Also, it guarantees that if you use some libraries that are also used by th2 you _won't use incompatible libraries' versions_.

You can find more information about what is 'BOM' and what is its purpose [here](https://en.wikipedia.org/wiki/Software_bill_of_materials).

## When you need to use BOM?

If you are developing a script or a component for th2 you need to use certain libraries for integration with th2-infra-schema and other components.
You need to know what version of each component to use and what versions are compatible.
Also, sometimes it's necessary to update versions.
In this case, you need to know which components versions to upgrade and if they are compatible with other dependencies.

That is where BOM comes in. It allows you to specify only the BOM's version in your dependencies.
The versions from other components will be taken from BOM (in case they are contained there) and you only need to specify which dependencies you need.

If you need to upgrade to newer components you will only need to update the BOM's version and the versions of your dependencies will be upgraded as well.
Also, they will be compatible with each other.

## BOM's versioning

The BOM's uses [semantic version](https://semver.org/). That means you can rely on its version to keep compatibility and to not break your code.

If you upgrade the **PATCH/MAINTENANCE** of BOM your code will still compile and keep working with the components
that are using BOM with the same MINOR and MAJOR versions.

If you upgrade the **MINOR** version of BOM your code will still compile and keep working with the components
that are using BOM with the same MAJOR and same or previous MINOR versions. Also, you became able to call API that was added in the current MINOR version.

If you upgrade the **MAJOR** version of BOM your code might not compile anymore because some components can have changes
that breaks backward compatibility. You might need to change your code to make it compile again.
Also, you might need to change some logic in your script/component (it depends on the changes made in the dependencies that you use).

## How to add BOM to your project?

The BOM is published as a regular Maven artifact. So it can be used in any project that supports maven's artifacts and supports BOM for dependencies management.

That means you can use BOM in Java projects that uses **Maven** or **Gradle** build-automation tools.

### Adding BOM to a Maven project

Here is an [official page](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html#bill-of-materials-bom-poms) about how to use BOM in your Maven project.

Please, note that Maven doesn't support wildcards for versions. So, you **can't define** a version like this: **1.0.+**
(in case you only need to worry about major and minor versions).
In this case, you need to specify the whole version, e.g. **1.0.1**;

### Adding BOM to a Gradle project

BOM is natively supported only since Gradle 5.0.
So, you will need to upgrade Gradle version first to use the BOM or to use third party plugins to emulate that behaviour.

Here is an [official page](https://docs.gradle.org/current/userguide/platforms.html) about using BOM in Gradle.

Also, Gradle supports wildcards for BOM's version (unlike Maven).
So you can declare that you need any BOM with certain major and minor versions, but you are not worried about patch/maintenance version.

In most cases it is not necessary, but it might be useful sometimes.

# Release notes:

## 4.13.1

### Updated
* gson 2.8.9 -> 2.13.1<br>
  because the 2.8.9 version has CVE-2025-53864 vulnerability

## 4.13.0

### Updated
* log4j-bom 2.24.3 -> 2.25.1
* netty-bom 4.2.1.Final -> 4.2.3.Final
* jackson-bom 2.19.0 -> 2.19.2
* amqp-client 5.25.0 -> 5.26.0
* commons-text 1.13.1 -> 1.14.0
* commons-lang3 3.17.0 -> 3.18.0
* commons-io 2.19.0 -> 2.20.0
* grpc-bom 1.73.0 -> 1.74.0

## 4.12.0

### Updated
* protobuf 3.25.5 -> 3.25.8
* netty-bom 4.1.119.Final -> 4.2.1.Final
* jackson-bom 2.18.2 -> 2.19.0
* jetbrains 24.1.0 -> 26.0.2
* commons-text 1.13.0 -> 1.13.1
* commons-io -> 2.18.0 -> 2.19.0
* commons-collections4 4.4 -> 4.5.0
* grpc-bom 1.70.0 -> 1.73.0

## 4.11.0

### Updated
* slf4j-bom 2.0.16 -> 2.0.17
* netty-bom 4.1.117.Final -> 4.1.119.Final
* amqp-client 5.24.0 -> 5.25.0

### Updated plugins
* owasp 12.0.1 -> 12.1.0

## 4.10.0

### Updated
* amqp-client 5.22.0 -> 5.24.0
* grpc-bom 1.68.1 -> 1.70.0
* netty-bom 4.1.115.Final -> 4.1.117.Final
* jackson-bom 2.18.1 -> 2.18.2
* commons-text commons-text 1.12.0 -> 1.13.0
* commons-io 2.17.0 -> 2.18.0
* guava 33.3.1-jre -> 33.4.0-jre
* log4j-bom 2.24.1 -> 2.24.3

### Updated plugins
* owasp 11.1.0 -> 12.0.1

## 4.9.0

### Updated
* grpc-bom 1.66.0 -> 1.68.1
* jackson-bom 2.17.2 -> 2.18.1
* netty-bom 4.1.113.Final -> 4.1.115.Final
* guava 33.3.0-jre -> 33.3.1-jre
* log4j-bom 2.24.0 -> 2.24.1

## 4.8.0

### Updated
* netty 4.1.112.Final -> 4.1.113.Final
* protobuf 3.25.4 -> 3.25.5 (fixed `CVE-2024-7254` vulnerability)
* log4j 2.23.1 -> 2.24.0
* amqp-client 5.21.0 -> 5.22.0
* commons-io 2.16.1 -> `2.17.0`

## 4.7.0

### Updated

* slf4j 2.0.7 -> 2.0.16
* log4j 2.23.0 -> 2.23.1
* grpc 1.62.2 -> 1.66.0
* protobuf 3.25.3 -> 3.25.4
* jackson 2.16.1 -> 2.17.2
* netty 4.1.108.Final -> 4.1.112.Final

## 4.6.1

### Updated

* netty 4.1.100.Final -> 4.1.108.Final
  * fix CVE-2024-29025

## 4.6.0

### Updated

* log4j 2.20.0 -> 2.23.0
* grpc 1.56.0 -> 1.62.2
* protobuf 3.23.3 -> 3.25.3
* jackson 2.15.2 -> 2.16.1
* cassandra driver 4.15.0 -> 4.17.0
* netty 4.1.94.Final -> 4.1.100.Final
* amqp-client 5.9.0 -> 5.20.0
* jetbrains-annotations 23.0.0 -> 24.1.0
* commons-test 1.10.0 -> 1.11.0
* commons-lang3 3.12.0 -> 3.14.0
* commons-io 2.11.0 -> 2.15.1
* commons-cli 1.5.0 -> 1.6.0
* google-guava 32.0.1-jre -> 33.0.0-jre

## 4.5.0

### Updated 
* kotlin-bom from `1.6.21` to `1.8.22`

### Gradle plugin
* added gradle-git-properties: `2.4.1`
* updated owasp from `8.2.1` to `8.3.1`

## 4.4.0

### Updated
* slf4j from `2.0.3` to `2.0.7`
* log4j from `2.19.0` to `2.20.0`
* gRPC from `1.48.1` to `1.56.0`
* protobuf from `3.21.7` to `3.23.3`
* netty from `4.1.93.Final` to `4.1.94.Final`
