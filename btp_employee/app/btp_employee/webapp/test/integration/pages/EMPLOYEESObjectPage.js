sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'trial01.emp.btpemployee',
            componentId: 'EMPLOYEESObjectPage',
            contextPath: '/EMPLOYEES'
        },
        CustomPageDefinitions
    );
});