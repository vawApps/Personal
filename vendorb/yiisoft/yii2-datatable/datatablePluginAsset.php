<?php

namespace yii\datatable;

use yii\web\AssetBundle;

/**
 * Asset bundle for the javascript files.
 *
 */
class datatablePluginAsset extends AssetBundle
{
	public $sourcePath = '@bower/datatable';
	public $js = [
		'datatables.min.js',
	];
	public $depends = [
        'yii\web\JqueryAsset',
        'yii\datatable\datatableAsset',
    ];
}
