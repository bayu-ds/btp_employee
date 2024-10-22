sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'trial01.emp.btpemployee',
            componentId: 'EMPLOYEESList',
            contextPath: '/EMPLOYEES'
        },
        CustomPageDefinitions
    );
});