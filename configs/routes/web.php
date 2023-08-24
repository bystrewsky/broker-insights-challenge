<?php

declare(strict_types = 1);

use App\Controllers\PoliciesController;
use Slim\App;

return function (App $app) {
    $app->get('/', [PoliciesController::class, 'index']);
};
