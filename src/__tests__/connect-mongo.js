import config from '../config';
import nconf from 'nconf';
import { connectPrimaryData } from '../connect/mongo';

config();

// important note, turn true to reset `test database`
console.log(nconf.get('NODE_ENV'), nconf.get('db:mongo'));
const db = nconf.get('db:mongo');

connectPrimaryData(db.uri, db.options, false);
