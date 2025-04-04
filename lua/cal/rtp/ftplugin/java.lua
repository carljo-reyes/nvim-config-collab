local jdtls = require('jdtls');
local mason_registry = require("mason-registry")

local home = os.getenv("HOME")

MASON = vim.fn.stdpath("data") .. "/mason"

-- JDTLS_PATH = MASON .. "/packages/jdtls"
JDTLS_PATH = home .. "/Programs/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository"

LAUNCHER = vim.fn.glob(JDTLS_PATH .. '/plugins/org.eclipse.equinox.launcher_*.jar')
LOMBOK = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
--
-- JDTLS_PATH = home .. "/Programs/jdtls/jdt-language-server-1.9.0-202203031534"
-- LOMBOK = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"

-- JAVA_DAP = vim.fn.glob(MASON ..
--     "/packages/java-debug-adapter" ..
--     "/extension/server/com.microsoft.java.debug.plugin-*.jar")

JAVA_DAP = vim.fn.glob(home ..
    "/Programs/java-debug" ..
    "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")

local bundles = { JAVA_DAP }
-- vim.list_extend(
--     bundles,
--     vim.split(
--         vim.fn.glob(
--             MASON ..
--             "/packages/java-test" ..
--             "/extension/server/*.jar",
--             true),
--         "\n")
-- )

vim.list_extend(
    bundles,
    vim.split(
        vim.fn.glob(
            home ..
            "/Programs/vscode-java-test" ..
            "/server/*.jar",
            true),
        "\n")
)

LSP_KEYS = require('cal.keymaps.lsp')
EXT_ON_ATTACH = function(_, bufnr)
    LSP_KEYS(_, bufnr)
    vim.keymap.set('n', "gI", function()
        jdtls.super_implementation();
    end)
    vim.keymap.set('n', "<leader>co", function()
        jdtls.organize_imports()
    end)
    vim.keymap.set('n', "<leader>;d", function()
        vim.cmd [[JdtUpdateDebugConfig]]
    end)
    vim.keymap.set('n', "<leader>;h", function()
        vim.cmd [[JdtUpdateHotcode]]
    end)
    vim.keymap.set('n', "<leader>;R", function()
        vim.cmd [[JdtRestart]]
    end)
    vim.keymap.set('n', "<leader>;W", function()
        vim.cmd [[JdtWipeDataAndRestart]]
    end)
    vim.keymap.set('n', "<leader>;bf", function()
        vim.cmd [[JdtCompile full]]
    end)

    vim.keymap.set('n', "<leader>;t", function()
        jdtls.test_nearest_method()
    end)
    vim.keymap.set('n', "<leader>;T", function()
        jdtls.test_class()
    end)
    vim.keymap.set('n', "<leader>;c", function()
        jdtls.test_class()
    end)
end

local root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1])
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = os.getenv("HOME") .. '/.workspace/' .. project_name
local workspace_dir = vim.fn.getcwd() .. '/../.workspace/' .. project_name

local capabilities = {
    workspace = {
        configuration = true
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true
            }
        }
    }
}

-- local pathExtractFirst = function(path)
--     local results = vim.fn.glob(path, false, true)
--     return results[#results]
-- end
--
vim.list_extend(capabilities, require('cmp_nvim_lsp').default_capabilities())
local extendedClientCapabilities = jdtls.extendedClientCapabilities;
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true;

local settings = {
    java = {
        signatureHelp = { enabled = true },
        completion = {
            favoriteStaticMembers = {
                "org.junit.jupiter.api.Assertions.*",
                "org.mockito.Mockito.*"
            }
        },
        templates = {
            fileHeader = {
                "/**",
                "* Globe FinTech Innovations, Inc.",
                "* Copyright (c) 2004-2024 All Rights Reserved.",
                "*/",
            },
            typeComment = {
                "$$type",
            }
        }
    }
}


local opts = {
    capabilities = capabilities,
    cmd = {
        home .. '/.sdkman/candidates/java/21.0.4-amzn/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. LOMBOK,
        '-jar', LAUNCHER,
        '-configuration', JDTLS_PATH .. '/config_linux',
        '-data', workspace_dir
    },
    root_dir = root_dir,
    on_attach = EXT_ON_ATTACH,
    init_options = {
        bundles = bundles,
        extendedClientCapabilities = extendedClientCapabilities,
    },
    settings = settings
}

jdtls.start_or_attach(opts)
