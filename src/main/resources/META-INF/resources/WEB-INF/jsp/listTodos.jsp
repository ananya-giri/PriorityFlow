<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container animate-fade-in my-4">
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                <div>
                    <h2 class="fw-bold mb-1" style="letter-spacing: -0.5px; background: linear-gradient(135deg, #fff 50%, #a5b4fc 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Your Priority Tasks</h2>
                    <p class="text-muted mb-0">Manage, edit, and keep track of all your active items.</p>
                </div>
                <a href="add-todo" class="btn btn-gradient">
                    <i class="fa-solid fa-plus me-2"></i>Create New Todo
                </a>
            </div>

            <div class="glass-card overflow-hidden">
                <div class="table-responsive">
                    <table class="table custom-table">
                        <thead>
                            <tr>
                                <th>#ID</th>
                                <th>Description</th>
                                <th>Target Date</th>
                                <th>Status</th>
                                <th class="text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${todos}" var="todo">
                                <tr>
                                    <td class="text-muted fw-bold">#${todo.id}</td>
                                    <td class="fw-medium">${todo.description}</td>
                                    <td>
                                        <span class="text-white-50"><i class="fa-regular fa-calendar me-2 opacity-75"></i>${todo.targetDate}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${todo.done}">
                                                <span class="badge-status badge-done">
                                                    <i class="fa-solid fa-circle-check"></i> Completed
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-status badge-pending">
                                                    <i class="fa-solid fa-circle-notch fa-spin"></i> Pending
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-end">
                                        <div class="d-inline-flex gap-2">
                                            <a href="update-todo?id=${todo.id}" class="btn btn-glass-edit btn-sm" title="Edit Todo">
                                                <i class="fa-solid fa-pen-to-square"></i> Edit
                                            </a>
                                            <a href="delete-todo?id=${todo.id}" class="btn btn-glass-danger btn-sm" title="Delete Todo" onclick="return confirm('Are you sure you want to delete this task?');">
                                                <i class="fa-solid fa-trash-can"></i> Delete
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty todos}">
                                <tr>
                                    <td colspan="5" class="text-center py-5 text-muted">
                                        <i class="fa-regular fa-folder-open fs-1 mb-3 d-block opacity-50"></i>
                                        No tasks found. Click "Create New Todo" to start planning!
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jspf" %>