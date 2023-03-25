sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'escalationsfe/test/integration/FirstJourney',
		'escalationsfe/test/integration/pages/EscalationsList',
		'escalationsfe/test/integration/pages/EscalationsObjectPage',
		'escalationsfe/test/integration/pages/CommentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, EscalationsList, EscalationsObjectPage, CommentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('escalationsfe') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEscalationsList: EscalationsList,
					onTheEscalationsObjectPage: EscalationsObjectPage,
					onTheCommentsObjectPage: CommentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);