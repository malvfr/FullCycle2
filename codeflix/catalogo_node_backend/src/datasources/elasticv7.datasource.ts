import {inject, lifeCycleObserver, LifeCycleObserver} from '@loopback/core';
import {juggler} from '@loopback/repository';

const config = {
  name: 'elasticv7',
  connector: 'esv6',
  index: 'catalogo',
  apiVersion: 7,
  debug: true,
  defaultSize: '',
  configuration: {
    node: process.env.ELASTIC_SEARCH_HOST,
    requestTimeout: process.env.ELASTIC_SEARCH_REQUEST_TIMEOUT,
    pingTimeout: process.env.ELASTIC_SEARCH_PING_TIMEOUT,
  },
  mappingProperties: {},
};

console.log(config);

// Observe application's life cycle to disconnect the datasource when
// application is stopped. This allows the application to be shut down
// gracefully. The `stop()` method is inherited from `juggler.DataSource`.
// Learn more at https://loopback.io/doc/en/lb4/Life-cycle.html
@lifeCycleObserver('datasource')
export class Elasticv7DataSource
  extends juggler.DataSource
  implements LifeCycleObserver
{
  static dataSourceName = 'elasticv7';
  static readonly defaultConfig = config;

  constructor(
    @inject('datasources.config.elasticv7', {optional: true})
    dsConfig: object = config,
  ) {
    super(dsConfig);
  }
}
