<?php

namespace yii\datatable;

use yii\web\AssetBundle;

/**
 * Asset bundle for the css files.
 *
 */
class datatableAsset extends AssetBundle
{
	public $sourcePath = '@bower/datatable';
	public $css = [
		'datatable.css',
	];
}
