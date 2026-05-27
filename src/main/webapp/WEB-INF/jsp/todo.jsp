<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container animate-fade-in my-5">
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="glass-card p-4 p-md-5">
                <div class="d-flex align-items-center gap-3 mb-4">
                    <span class="d-inline-flex align-items-center justify-content-center rounded-circle" style="width: 54px; height: 54px; background: rgba(99, 102, 241, 0.15); border: 1px solid rgba(99, 102, 241, 0.3);">
                        <i class="fa-solid fa-pen-to-square fs-4" style="color: #a5b4fc;"></i>
                    </span>
                    <div>
                        <h3 class="fw-bold mb-1" style="letter-spacing: -0.5px;">
                            <c:choose>
                                <c:when test="${todo.id == 0}">Create New Task</c:when>
                                <c:otherwise>Edit Task #${todo.id}</c:otherwise>
                            </c:choose>
                        </h3>
                        <p class="text-muted mb-0">Fill in the fields to specify task details and targets.</p>
                    </div>
                </div>

                <form:form method="post" modelAttribute="todo" class="needs-validation">
                    <form:hidden path="id" />
                    <form:hidden path="username" />
                    
                    <div class="mb-4">
                        <label for="description" class="form-label">Task Description</label>
                        <form:input type="text" path="description" id="description" class="form-control glass-input" placeholder="What needs to be done? (Minimum 10 characters)" required="required" autocomplete="off" />
                        <form:errors path="description" cssClass="validation-error" />
                    </div>

                    <div class="mb-4">
                        <label for="targetDate" class="form-label">Target Date</label>
                        <form:input type="text" path="targetDate" id="targetDate" class="form-control glass-input" required="required" />
                        <form:errors path="targetDate" cssClass="validation-error" />
                    </div>

                    <c:if test="${todo.id != 0}">
                        <div class="mb-4">
                            <div class="form-check form-switch p-0 d-flex align-items-center gap-3">
                                <form:checkbox path="done" id="done" class="form-check-input glass-input m-0" style="width: 48px; height: 24px; cursor: pointer;" />
                                <label class="form-check-label text-white fw-medium m-0" for="done" style="cursor: pointer;">
                                    Mark this task as fully completed
                                </label>
                            </div>
                        </div>
                    </c:if>

                    <div class="d-flex justify-content-end gap-3 mt-5 pt-3 border-top" style="border-top-color: var(--glass-border) !important;">
                        <a href="list-todos" class="btn btn-glass-secondary px-4 py-2">
                            <i class="fa-solid fa-xmark me-2"></i>Cancel
                        </a>
                        <button type="submit" class="btn btn-gradient px-4 py-2">
                            <i class="fa-solid fa-cloud-arrow-up me-2"></i>Save Task
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jspf" %>
