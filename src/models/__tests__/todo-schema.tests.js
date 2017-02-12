import TodosModel from '../todo-schema';
import {
  toObjectId,
  isObjectId,
} from '../../utils/to-objectid';
import isDate from 'lodash/isDate';
import test from 'tape';

test('TodosModel create a new record', async function (t) {
  t.plan(3);
  // remove all
  await TodosModel().remove({});

  let task = await TodosModel().create({
    title: 'go to somewhere',
    done: true,
  });
  t.equal(isDate(task.createdAt), true, 'createdAt should be Date type');
  t.equal(isDate(task.updatedAt), true, 'createdAt should be Date type');
  t.equal(task.__v, 0, '__v should equal 0');
});
