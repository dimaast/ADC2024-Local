document.addEventListener('DOMContentLoaded', function () {
    // Получаем все кнопки для показа/скрытия пароля
    const toggleButtons = document.querySelectorAll('.toggle-password');
    
    toggleButtons.forEach(button => {
      button.addEventListener('click', function () {
        const passwordField = document.getElementById(button.getAttribute('data-target'));
        const eyeOpenIcon = button.querySelector('svg[id^="eye-open"]');
        const eyeClosedIcon = button.querySelector('svg[id^="eye-closed"]');
        
        if (passwordField.type === 'password') {
          passwordField.type = 'text';
          eyeOpenIcon.style.display = 'none';
          eyeClosedIcon.style.display = 'block';
        } else {
          passwordField.type = 'password';
          eyeOpenIcon.style.display = 'block';
          eyeClosedIcon.style.display = 'none';
        }
      });
    });
  });
  