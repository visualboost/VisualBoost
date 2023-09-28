# Introduction

Welcome to VisualBoost - A Software development tool.<br>

<br>
<br>
<p align="center">
  <img src="images/visualboost_intro.png" />
</p>
<br>
<br>

**VisualBoost** is an open-source software that enables developers to create and define backends in a simple and visual manner. With VisualBoost, you can create a clear backend description that serves as the foundation for generating a functional Node.js and MongoDB backend when linked to a Git repository. This innovative tool offers a variety of features that streamline and expedite backend development:

- **Data Modeling and Class Management:**
  Within VisualBoost, you can easily and visually define the structure of your backend. This includes creating and editing data models, which are categorized into three main types:

    - **Model:** This category allows you to create data models that can encompass both attributes and functions.
    - **Class:** The class representation corresponds to pure data classes, defining attributes only without including functions.
    - **Enum:** In VisualBoost, enums align with common enumerations and provide the means to represent fixed data sets or options.

Using VisualBoost not only offers developers remarkable time savings but also ensures they have a visual overview of their backend at all times. Instead of having to write complex code from scratch, developers can efficiently design backends. The automatic generation of a functional Node.js and MongoDB backend ensures a seamless transformation of your backend description into a fully operational application. VisualBoost empowers developers to reduce time and effort, allowing them to focus more on implementing their creative ideas.

# How to run

---

### Prerequisites

- Docker: ``v20.10.21 or higher``
- Docker-Compose: ``v2.21.0 or higher``


### Step 1 - Access the repository
Pull or download the ``https://github.com/JensWinkler91/VisualBoost.git``

#### To download the repository (Linux):
````shell
curl -L -H  "Accept: application/vnd.github+json" https://api.github.com/repos/JensWinkler91/VisualBoost/zipball/main -o visualboost.zip && unzip visualboost.zip -d VisualBoost
````

### Step 2 - Navigate
Navigate into the directory `docker/local` if you want to run VisualBoost on your local machine. 

Navigate into the directory `docker/remote` if you want to run VisualBoost on a server. The docker-compose.yml inside `docker/remote` contains
a certbot container to generate a letsencrypt certificate for you before the application will be started.

### Step 3 - Configuration
Add or adapt the configuration variables in `.env` that are marked with `Please adapt`. 
For further information please check the `Configuration`section below.

### Step 4 - Start the application
````shell
docker-compose up
````

# Configuration

---

## Docker Configuration

| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `COMPOSE_PROJECT_NAME`                     | `visualboost`                             | Name of the Docker project                              |

### Container Names
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `AUTH_MONGO_CONTAINER_NAME`                | `mongoauth`                               | Name of the authentication MongoDB container          |
| `AUTH_APP_CONTAINER_NAME`                  | `visualboost_auth`                        | Name of the authentication application container      |
| `MAIN_MONGO_CONTAINER_NAME`                | `mongomain`                               | Name of the main MongoDB container                    |
| `MAIN_APP_CONTAINER_NAME`                  | `visualboost_main`                        | Name of the main application container                |
| `BUILD_MONGO_CONTAINER_NAME`               | `mongobuild`                              | Name of the build MongoDB container                   |
| `BUILD_APP_CONTAINER_NAME`                 | `visualboost_build`                       | Name of the build application container               |
| `REACT_APP_CONTAINER_NAME`                 | `visualboost_react`                       | Name of the React application container               |

### Networks
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `NETWORK_AUTH`                             | `visual_boost_auth_network`                | Name of the authentication network                     |
| `NETWORK_MAIN`                             | `visual_boost_main_network`                | Name of the main network                               |
| `NETWORK_BUILD`                            | `visual_boost_build_network`               | Name of the build network                              |

## Database Configuration

### MongoDB - User & Database
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `MONGO_ADMIN`                              | `Admin`                                   | MongoDB Admin user                                   |
| `MONGO_ADMIN_PW`                           | -                          | Password for the MongoDB Admin user                    |
| `MONGO_USER`                               | `User`                                    | MongoDB user with read/write access to the database   |
| `MONGO_USER_PW`                            | -                          | Password for the MongoDB user                         |
| `MONGO_DB_NAME`                            | `db`                                      | Name of the database                                 |

### Ports
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `MONGO_PORT_AUTH`                          | `40001`                                   | Port for the authentication database                   |
| `MONGO_PORT_MAIN`                          | `40011`                                   | Port for the main database                            |
| `MONGO_PORT_BUILD`                         | `40021`                                   | Port for the build database                            |

### Volumes/Directories
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `MONGO_DATA_DIR_AUTH`                      | `./../../data/auth`                       | Directory for the authentication service               |
| `MONGO_DATA_DIR_BUILD`                     | `./../../data/build`                      | Directory for the build service                       |
| `MONGO_DATA_DIR_MAIN`                      | `./../../data/main`                       | Directory for the main service                        |

## Connectivity Configuration

| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `DOMAIN`                                   | -                          | Domain of the applications, e.g., http://localhost     |

### Application Ports
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `HTTP_PORT_AUTH`                           | `40000`                                   | HTTP port for the authentication service                |
| `HTTP_PORT_MAIN`                           | `40010`                                   | HTTP port for the main service                         |
| `HTTP_PORT_BUILD`                          | `40020`                                   | HTTP port for the build service                        |
| `HTTP_PORT_REACT`                          | `44444`                                   | HTTP port for the React service                        |

## Secrets Configuration
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `JWT_SECRET`                               | -                          | Secret used for creating and verifying JWTs            |
| `INTERNAL_KEY`                             | -                          | Key to access the private API                          |
| `ENCRYPTION_KEY`                           | -                          | 32-bit key used for data encryption/decryption         |

## E-Mail Credentials
| Parameter                                  | Default Value                             | Description                                           |
|--------------------------------------------|-------------------------------------------|--------------------------------------------------------|
| `MAIL_HOST`                                | -                          | Host for email login credentials                       |
| `MAIL_PORT`                                | -                          | Port for email login credentials                       |
| `MAIL_USER`                                | -                          | Username for email login credentials                    |
| `MAIL_PW`                                  | -                          | Password for email login credentials                    |

## Project Settings
| Parameter                                  | Default Value                                       | Description                                           |
|--------------------------------------------|-----------------------------------------------------|--------------------------------------------------------|
| `GIT_OPTIONS_BASE_PROJECT_REPOSITORY`                                | `github.com/JensWinkler91/VisualBoost_Node_Base.git` | Host for email login credentials                       |
| `GIT_OPTIONS_BASE_PROJECT_BRANCH`                                | `main`                                              | Port for email login credentials                       |
