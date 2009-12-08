function destroy(that) {
    if (confirm('Are you sure?')) { 
        var f = document.createElement('form'); 
        f.style.display = 'none'; 
        that.parentNode.appendChild(f); 
        f.method = 'POST'; 
        f.action = that.href.match(/(.*)\/delete/)[1];
        var m = document.createElement('input'); 
        m.setAttribute('type', 'hidden'); 
        m.setAttribute('name', '_method'); 
        m.setAttribute('value', 'delete'); 
        f.appendChild(m);
        f.submit(); 
    };
}
