<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container animate-fade-in my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="glass-card p-5 text-center">
                <div class="mb-4">
                    <span class="d-inline-flex align-items-center justify-content-center rounded-circle" style="width: 80px; height: 80px; background: rgba(99, 102, 241, 0.15); border: 1px solid rgba(99, 102, 241, 0.3);">
                        <i class="fa-solid fa-wand-magic-sparkles fs-1 text-indigo-400" style="color: #a5b4fc;"></i>
                    </span>
                </div>
                
                <h1 class="display-5 fw-bold mb-3" style="letter-spacing: -1px; background: linear-gradient(135deg, #fff 50%, #a5b4fc 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Welcome back, ${name}!</h1>
                
                <p class="lead text-muted mb-5 mx-auto" style="max-width: 600px; font-size: 1.15rem; line-height: 1.6;">
                    Ready to achieve peak productivity today? Organize your schedules, set clear targets, and effortlessly keep track of your priority milestones.
                </p>
                
                <div class="d-flex flex-wrap justify-content-center gap-3">
                    <a href="list-todos" class="btn btn-gradient px-4 py-3">
                        <i class="fa-solid fa-list-check me-2"></i>Go to Dashboard
                    </a>
                    <a href="add-todo" class="btn btn-glass-secondary px-4 py-3">
                        <i class="fa-solid fa-plus me-2"></i>Create New Task
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jspf" %>