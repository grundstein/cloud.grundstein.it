import { is } from '@magic/test'

import config from '../grundstein-config.mjs'

console.log(config)

export default [
  { fn: is.object(config), info: 'config is an object' },
  { fn: is.object(config.env), info: 'config.env is an object' },
  { fn: is.array(config.hosts), info: 'config.hosts is an array' },
]
