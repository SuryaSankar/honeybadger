var data = [
    {
        label: 'Anna University Chennai',
        children: [
            { 
		label: 'Computer Science and Engineering',
		children: [
		{label: 'Semester1'}
		]
	 },
            { label: 'Mechanical Engineering' }
        ]
    }
];
$(function(){
    $('#tree1').tree({
        data: data
    });
}
);
