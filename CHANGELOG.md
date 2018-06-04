## v1.14 (Unreleased)


## [v1.13](https://github.com/google-terraform-modules/terraform-google-kubernetes-engine/compare/1.12...1.13) (June 4, 2018)

* Add new outputs **username** & **password** - [2ee232e (line)](https://github.com/perriea/terraform-google-kubernetes-engine/commit/2ee232e3c2ef3161298cb2c6bbe8f14e8c9cc68a#diff-c09d00f135e3672d079ff6e0556d957dR21)
* Add new value **metadata** (map `default_node_pool`) - [b7128fb (line)](https://github.com/perriea/terraform-google-kubernetes-engine/commit/b7128fb16801085dabcabda8eb82c4f081099ad8#diff-7a370d8342e7203b805911c92454f0f4R122)
* Add new block **workload_metadata_config** (map `default_node_pool`) - [b7128fb (line)](https://github.com/perriea/terraform-google-kubernetes-engine/commit/b7128fb16801085dabcabda8eb82c4f081099ad8#diff-7a370d8342e7203b805911c92454f0f4R124)
* Change default values for [7f7b6b1](https://github.com/perriea/terraform-google-kubernetes-engine/commit/7f7b6b1917d35168f95485ba5bc900ece83dec70) :
    * **node_count** (map `default_node_pool`): `2` (before `1`),
    * **remove** (map `default_node_pool`): `false` (before `true`).


## [v1.12](https://github.com/google-terraform-modules/terraform-google-kubernetes-engine/compare/1.11...1.12) (May 8, 2018)

* Fix attribution of variables - [a801232 (line)](https://github.com/perriea/terraform-google-kubernetes-engine/commit/a801232e702ac3e4b46a4ada4f815b8717e58e4c#diff-c9ac8098c5ea9d3e6a9a596ff0c512a4R44)
* Add new variables `labels` map and `tags` list - [a801232 (line)](https://github.com/perriea/terraform-google-kubernetes-engine/commit/a801232e702ac3e4b46a4ada4f815b8717e58e4c#diff-c9ac8098c5ea9d3e6a9a596ff0c512a4R81)
* Add new key `service_account` in `default_node_pool` - [a801232 (line)](https://github.com/perriea/terraform-google-kubernetes-engine/commit/a801232e702ac3e4b46a4ada4f815b8717e58e4c#diff-7a370d8342e7203b805911c92454f0f4R123)


## [v1.11](https://github.com/google-terraform-modules/terraform-google-kubernetes-engine/compare/1.8...1.11) (May 5, 2018)

* Change model for key value - [45401b5](https://github.com/google-terraform-modules/terraform-google-kubernetes-engine/commit/45401b56f1036893f9d8be96cb754f2aeb18aa0c)
* Full additional pool management - [77ae3cd](https://github.com/google-terraform-modules/terraform-google-kubernetes-engine/commit/77ae3cd15909e034cd72cebb165ce7f997331645)
* Add new inputs of provider (private cluster, remove default pool, node taint ...). See the official [changelog](https://github.com/terraform-providers/terraform-provider-google/blob/master/CHANGELOG.md#1110-may-01-2018) of Google provider.