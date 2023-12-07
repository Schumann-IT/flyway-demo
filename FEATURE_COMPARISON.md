# Feature Comparison

| Feature                              | Flyway                                                                                                                                         | Atlas                                                           |
|--------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| Declarative Workflow                 | No                                                                                                                                             | [Yes](https://atlasgo.io/declarative/apply)                     |
| Data Seeding in Declarative Workflow | No                                                                                                                                             | No                                                              |
| Versioned Workflow                   | [Yes](https://documentation.red-gate.com/flyway/learn-more-about-flyway/development-approaches-with-flyway)                                    | [Yes](https://atlasgo.io/versioned/apply)                       |
| Data Seeding in Versioned Workflow   | Yes                                                                                                                                            | Yes                                                             |
| Kubernetes Operator                  | No                                                                                                                                             | [Yes](https://atlasgo.io/integrations/kubernetes/operator)      |
| Kubernetes Job                       | Yes                                                                                                                                            | Yes                                                             |
| Kubernetes CronJob                   | Yes                                                                                                                                            | Yes                                                             |
| Maven integration                    | [Yes](https://documentation.red-gate.com/flyway/quickstart-how-flyway-works/quickstart-maven)                                                  | No                                                              |
| Desktop App                          | [Yes](https://documentation.red-gate.com/flyway/quickstart-how-flyway-works/quickstart-using-flyway-desktop-with-the-flyway-community-edition) | No                                                              |
| Web UI                               | No                                                                                                                                             | [Yes](https://atlasgo.io/declarative/inspect#visualize-schemas) |
| CLI                                  | [Yes](https://documentation.red-gate.com/flyway/flyway-cli-and-api)                                                                            | [Yes](https://atlasgo.io/cli-reference)                         |
| API                                  | [Yes](https://documentation.red-gate.com/flyway/flyway-cli-and-api)                                                                            | No                                                              |

## User Workflow Examples

### Spring integration

_Flyway_
- Define flyway as a dependency in pom.xml: restart spring app to migrate the DB

_Atlas_
- Spring integration n/a

### CLI

The difference is, 
- that with Atlas you can use the declarative workflow and thus do not need to create migration files
- Flyway is configured via a config file whereas Atlas is configured via CLI parameters

_Flyway_
```
mvn flyway migrate
```

_Atlas_
```
atlas migrate apply --dir "file://src/main/resources/db.migration" --url 'postgresql://postgres:postgres123@localhost:5432/postgres'
```

### Docker Compose

_Flyway_ AND _Atlas_
```
docker-compose up migration
```

## Kubernetes Deployment Examples

### Kubernetes Operator

_Flyway_
- Kubernetes Operator n/a

_Atlas_
- A AtlasSchema CRD needs to be maintained in the cluster

### Kubernetes Job

No difference between Flyway and Atlas: An image containing that includes the tool (Flyway/Atlas) and the migration files.
That imgae can then be used within a kubernetes job.