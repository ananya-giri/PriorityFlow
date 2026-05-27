<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | PriorityFlow</title>
    <!-- Bootstrap 5 CSS -->
    <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --bg-gradient: linear-gradient(135deg, #090d16 0%, #111827 50%, #1e1b4b 100%);
            --glass-bg: rgba(17, 24, 39, 0.65);
            --glass-border: rgba(255, 255, 255, 0.07);
            --text-primary: #f3f4f6;
            --text-muted: #9ca3af;
            --accent-primary: #6366f1;
            --accent-secondary: #a855f7;
            --accent-danger: #ef4444;
            --card-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.5);
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: var(--bg-gradient);
            background-attachment: fixed;
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
            overflow-x: hidden;
        }

        .login-container {
            width: 100%;
            max-width: 480px;
            animation: fadeIn 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }

        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            box-shadow: var(--card-shadow);
            padding: 3rem 2.5rem;
        }

        .navbar-brand-custom {
            font-weight: 800;
            font-size: 2.2rem;
            background: linear-gradient(135deg, #ffffff 40%, #a5b4fc 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -1px;
            text-align: center;
            margin-bottom: 0.5rem;
            display: block;
            text-decoration: none;
        }
        
        .navbar-brand-custom span {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .glass-input {
            background: rgba(17, 24, 39, 0.8) !important;
            border: 1px solid var(--glass-border) !important;
            color: var(--text-primary) !important;
            border-radius: 12px !important;
            padding: 0.85rem 1.2rem !important;
            transition: all 0.3s ease !important;
            font-size: 1rem;
        }

        .glass-input:focus {
            background: rgba(17, 24, 39, 0.95) !important;
            border-color: var(--accent-primary) !important;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.25) !important;
            outline: none !important;
        }

        .btn-gradient {
            background: linear-gradient(135deg, var(--accent-primary) 0%, var(--accent-secondary) 100%);
            border: none;
            color: white;
            font-weight: 600;
            border-radius: 12px;
            padding: 0.9rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.35);
            width: 100%;
            font-size: 1.05rem;
            letter-spacing: 0.5px;
        }

        .btn-gradient:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.55);
            opacity: 0.95;
            color: white;
        }

        label {
            color: var(--text-muted);
            font-weight: 500;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            letter-spacing: 0.3px;
        }

        .alert-custom {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.2);
            color: #fca5a5;
            border-radius: 12px;
            padding: 0.8rem 1rem;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="glass-card">
            
            <a class="navbar-brand-custom" href="#">
                <i class="fa-solid fa-square-check me-2 text-indigo-400"></i>Priority<span>Flow</span>
            </a>
            
            <p class="text-center text-muted mb-4" style="font-size: 1rem;">Task Management, Refined.</p>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-custom mb-4" role="alert">
                    <i class="fa-solid fa-circle-exclamation fs-5"></i>
                    <div>${errorMessage}</div>
                </div>
            </c:if>

            <form method="post" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label for="name" class="form-label">Username</label>
                    <input type="text" class="form-control glass-input" id="name" name="name" required placeholder="Enter username (Ananya)" autocomplete="off">
                </div>
                
                <div class="mb-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <label for="password" class="form-label">Password</label>
                    </div>
                    <input type="password" class="form-control glass-input" id="password" name="password" required placeholder="Enter password (dummy)">
                </div>

                <button type="submit" class="btn btn-gradient">
                    <i class="fa-solid fa-right-to-bracket me-2"></i>Sign In
                </button>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>