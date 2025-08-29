'use strict';

var path = require('path');
var http = require('http');

var oas3Tools = require('oas3-tools');
var serverPort = 8080;

// 純粹 API 文檔展示，不需要路由控制器
var options = {
    swaggerUi: '/fes/api/doc',
    // 移除 routing 配置，專注於 API 規格展示
};

var expressAppConfig = oas3Tools.expressAppConfig(path.join(__dirname, 'api/api-specification.yaml'), options);
var app = expressAppConfig.getApp();

// Initialize the Swagger middleware
http.createServer(app).listen(serverPort, function () {
    console.log('Your server is listening on port %d (http://localhost:%d)', serverPort, serverPort);
    console.log('Swagger-ui is available on http://localhost:%d/docs', serverPort);
});
