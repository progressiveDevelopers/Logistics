/**
 * 
 */
var myChart = echarts.init(document.getElementById('main'));

$.get('/Logistics/userData/userRelativeTree.shtml', function (data) {
    
    data = JSON.parse(data);
    
    myChart.setOption(option = {
        tooltip: {
            trigger: 'item',
        },
        series: [
            {
                type: 'tree',
                data: [data],
                symbolSize: 7,
                label: {
                    normal: {
                        position: 'right',
                        fontSize: 18
                    }
                },

                leaves: {
                    label: {
                        normal: {
                            position: 'right'
                        }
                    }
                },

                expandAndCollapse: false
            }
        ]
    });
});

