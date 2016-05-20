/**
 * Created by snooki on 31.03.16.
 */
$(function() {
    var parseQueryString = function (strQuery) {
        var strSearch = strQuery.substr(1),
            strPattern = /([^=]+)=([^&]+)&?/ig,
            arrMatch = strPattern.exec(strSearch),
            objRes = {};
        while (arrMatch != null) {
            objRes[arrMatch[1]] = arrMatch[2];
            arrMatch = strPattern.exec(strSearch);
        }
        return objRes;
    };

    var get = window.location.search;
    if (get != '') {
        var parseObj = parseQueryString(get);

        var updateState = parseObj['hideUpdate'];
        var saveState = parseObj['hideSave'];

        if (saveState == '1') {
            $('#save').hide();
        }

        if (updateState == '1') {
            $('#update').hide();
        }
    }
})