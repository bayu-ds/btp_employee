sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'trial01/emp/btpemployee/test/integration/FirstJourney',
		'trial01/emp/btpemployee/test/integration/pages/EMPLOYEESList',
		'trial01/emp/btpemployee/test/integration/pages/EMPLOYEESObjectPage'
    ],
    function(JourneyRunner, opaJourney, EMPLOYEESList, EMPLOYEESObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('trial01/emp/btpemployee') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEMPLOYEESList: EMPLOYEESList,
					onTheEMPLOYEESObjectPage: EMPLOYEESObjectPage
                }
            },
            opaJourney.run
        );
    }
);