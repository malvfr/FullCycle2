import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {Elasticv7DataSource} from '../datasources';
import {Category, CategoryRelations} from '../models';

export class CategoryRepository extends DefaultCrudRepository<
  Category,
  typeof Category.prototype.id,
  CategoryRelations
> {
  constructor(
    @inject('datasources.elasticv7') dataSource: Elasticv7DataSource,
  ) {
    super(Category, dataSource);
  }
}
