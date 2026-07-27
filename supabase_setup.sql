-- Supabase 建表 SQL
-- 在 Supabase Dashboard -> SQL Editor 中执行以下所有语句

-- 1. 创建用户进度表
CREATE TABLE IF NOT EXISTS user_progress (
  username TEXT PRIMARY KEY,
  data JSONB NOT NULL DEFAULT '{}',
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 启用行级安全 (RLS)
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;

-- 3. 允许匿名用户读写（因为应用用用户名标识，不需要密码认证）
CREATE POLICY "Enable all for anon" ON user_progress
  FOR ALL
  TO anon, authenticated
  USING (true)
  WITH CHECK (true);

-- 4. 验证表已创建
SELECT 'user_progress table created successfully' as status;
